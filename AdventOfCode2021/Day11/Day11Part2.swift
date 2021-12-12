//
//  Day11Part2.swift
//  AdventOfCode2021
//
//  Created by Inspiro developer on 11/12/2021.
//

import Foundation

class Day11Part2: PartRunner
{
  class Octopus: Comparable, Equatable, CustomStringConvertible
  {
    var energyLevel: Int
    var hasFlashed: Bool
    var description: String
    {
      return "\(energyLevel)"
    }
    init(energyLevel: Int)
    {
      self.energyLevel = energyLevel
      hasFlashed = false
    }

    static func < (lhs: Octopus, rhs: Octopus) -> Bool
    {
      return lhs.energyLevel < rhs.energyLevel
    }

    static func == (lhs: Octopus, rhs: Octopus) -> Bool
    {
      return lhs.energyLevel == rhs.energyLevel
    }
  }

  override func doStuff(with input: String) -> String
  {
    let field: Field2D<Octopus> = Field2D<Octopus>(defaultValue: Octopus(energyLevel: 0), enableDiagonals: true)
    for (y, line) in input.split(separator: "\n").enumerated()
    {
      for (x, energyLevel) in line.enumerated()
      {
        field.setValue(Octopus(energyLevel: energyLevel.wholeNumberValue!), at: Field2D<Octopus>.Coordinate(y: y, x: x))
      }
    }

    var i: Int = 0
    for _ in 0..<1000
    {
      i+=1
      if iterate(field: field) == (field.getWidth() * field.getHeight())
      {
        break
      }
    }

    return "\(i)"
  }

  func iterate(field: Field2D<Octopus>) -> Int
  {
    // Step1 increase by 1
    for coordinate in field
    {
      let octopus: Octopus = field.getValue(at: coordinate)
      octopus.energyLevel += 1
      field.setValue(octopus, at: coordinate)
    }

    // Step2 flash
    var nrOfFlashes: Int = 0
    for coordinate in field
    {
      nrOfFlashes += tryFlash(in: field, at: coordinate)
    }

    // Step 3 reset
    for coordinate in field
    {
      if field.getValue(at: coordinate).energyLevel > 9
      {
        // After a flash, the octopus dies, but it spawns a new one with no energy
        // THE CIRCLE OF LIFE!!!!!!
        field.setValue(Octopus(energyLevel: 0), at: coordinate)
      }
    }
    return nrOfFlashes
  }

  func tryFlash(in field: Field2D<Octopus>, at coordinate: Field2D<Octopus>.Coordinate) -> Int
  {
    let octopus: Octopus = field.getValue(at: coordinate)
    var nrOfFlashes: Int = 0
    if octopus.energyLevel > 9 && !octopus.hasFlashed
    {
      nrOfFlashes += 1
      octopus.hasFlashed = true
      for neighbour in field.getNeighbourCoordinates(of: coordinate)
      {
        if let octopusBuddy: Octopus = field.getValue(at: neighbour)
        {
          octopusBuddy.energyLevel += 1
          field.setValue(octopusBuddy, at: neighbour) // TODO: Check needed

          nrOfFlashes += tryFlash(in: field, at: neighbour)
        }
      }
    }
    return nrOfFlashes
  }

  override func cleanUp()
  {
  }
}
