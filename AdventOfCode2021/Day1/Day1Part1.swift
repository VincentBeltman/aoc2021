//
//  Day1Part1.swift
//  AdventOfCode2021
//
//  Created by Inspiro developer on 01/12/2021.
//

import Foundation

class Day1Part1: PartRunner
{
  override func doStuff(with input: String) -> String
  {
    let lines: [String.SubSequence] = input.split(separator: "\n")
    var previous: Int?
    var count: Int = 0

    log("Running part 1")

    for line in lines
    {
      if let number: Int = Int(line)
      {
        if let previous = previous
        {
          if number > previous
          {
            log("Increasing from \(previous) to \(number)")
            count += 1
          }
          else
          {
            log("Decreasing from \(previous) to \(number)")
          }
        }
        previous = number
      }
    }

    return "\(count)"
  }

  override func cleanUp()
  {
  }
}
