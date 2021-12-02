//
//  Day2Part1.swift
//  AdventOfCode2021
//
//  Created by Inspiro developer on 02/12/2021.
//

import Foundation

class Day2Part1: PartRunner
{
  override func doStuff(with input: String) -> String
  {
    let lines: [String.SubSequence] = input.split(separator: "\n")

    log("Running part 1 of day 2")

    var x: Int = 0
    var y: Int = 0

    for line in lines
    {
      let lineParts: [String.SubSequence] = line.split(separator: " ")
      switch lineParts[0]
      {
      case "forward":
        x += Int(lineParts[1])!
      case "down":
        y += Int(lineParts[1])!
      case "up":
        y -= Int(lineParts[1])!
      default:
        assert(false, "Should never happen, pancake")
      }
    }

    return "\(x*y)"
  }

  override func cleanUp()
  {
  }
}
