//
//  Day7Part1.swift
//  AdventOfCode2021
//
//  Created by Inspiro developer on 07/12/2021.
//

import Foundation

class Day7Part1: PartRunner
{
  override func doStuff(with input: String) -> String
  {
    let crabs: [String.SubSequence] = input.split(separator: ",")
    var sorted: [Int] = []

    for crab in crabs
    {
      let intCrab: Int = Int(crab)!
      var i: Int = 0
      while i < sorted.count
      {
        if sorted[i] > intCrab
        {
          break
        }
        i += 1
      }

      sorted.insert(intCrab, at: i)
    }
    let median: Int = sorted[sorted.count/2]
    log("Median: \(median)")

    var fuel: Int = 0
    for crab in sorted
    {
      fuel += abs(median - crab)
    }

    return "\(fuel)"
  }

  override func cleanUp()
  {
  }
}
