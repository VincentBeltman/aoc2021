//
//  Day5Part1.swift
//  AdventOfCode2021
//
//  Created by Inspiro developer on 05/12/2021.
//

import Foundation

class Day5Part1: PartRunner
{
  private var field: IntField2D = IntField2D(defaultValue: 0)

  override func doStuff(with input: String) -> String
  {
    parse(input)
    log("\(field)")
    
    return "\(field.countNrOfOccurrences(biggerThanOrEqualTo: 2))"
  }

  func parse(_ input: String)
  {
    let lines: [String.SubSequence] = input.split(separator: "\n")

    for line in lines
    {
      let parts: [String] = line.components(separatedBy: " -> ")
      let startCoordinateParts: [String.SubSequence] = parts[0].split(separator: ",")
      let endCoordinateParts: [String.SubSequence] = parts[1].split(separator: ",")
      let startCoordinate: IntField2D.Coordinate = IntField2D.Coordinate(
        y: Int(startCoordinateParts[1])!,
        x: Int(startCoordinateParts[0])!)
      let endCoordinate: IntField2D.Coordinate = IntField2D.Coordinate(
        y: Int(endCoordinateParts[1])!,
        x: Int(endCoordinateParts[0])!)
      field.addRange(1, atRange: IntField2D.CoordinateRange(start: startCoordinate, end: endCoordinate))
    }
  }

  override func cleanUp()
  {
    field = IntField2D(defaultValue: 0)
  }
}
