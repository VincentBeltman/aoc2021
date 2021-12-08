//
//  Day8Part1.swift
//  AdventOfCode2021
//
//  Created by Inspiro developer on 08/12/2021.
//

import Foundation

class Day8Part1: PartRunner
{
  override func doStuff(with input: String) -> String
  {
    let lines: [String.SubSequence] = input.split(separator: "\n")

    var total: Int = 0

    for line in lines
    {
      let parts: [String.SubSequence] = line.split(separator: "|")
      for digit in parts[1].split(separator: " ") where digit.count == 2 || digit.count == 3 || digit.count == 4 || digit.count == 7
      {
        total += 1
      }
    }

    return "\(total)"
  }

  override func cleanUp()
  {
  }
}
