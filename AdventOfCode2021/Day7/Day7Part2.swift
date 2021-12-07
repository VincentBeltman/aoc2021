//
//  Day7Part2.swift
//  AdventOfCode2021
//
//  Created by Inspiro developer on 07/12/2021.
//

import Foundation

class Day7Part2: PartRunner
{
  override func doStuff(with input: String) -> String
  {
    var crabs: [Int] = []

    var total: Double = 0
    for rawCrab in input.split(separator: ",")
    {
      let crab: Double = Double(rawCrab)!
      total += crab
      crabs.append(Int(crab))
    }

    let average: Int = Int(round(total/Double(crabs.count)))

    var before: Int = 0
    var at: Int = 0
    var after: Int = 0
    for crab in crabs
    {
      before += calcTriangularNumber(abs(crab - average - 1))
      at += calcTriangularNumber(abs(crab - average))
      after += calcTriangularNumber(abs(crab - average + 1))
    }

    // This method has a 0.5 error margin
    return "\(min(min(before, at), after))"
  }

  func calcTriangularNumber(_ number: Int) -> Int
  {
    return Int(round((Double(number) * Double(number + 1)) / 2.0))
  }

  override func cleanUp()
  {
  }
}
