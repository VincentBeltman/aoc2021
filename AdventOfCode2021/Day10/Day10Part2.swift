//
//  Day1Part2.swift
//  AdventOfCode2021
//
//  Created by Inspiro developer on 10/12/2021.
//

import Foundation

class Day10Part2: PartRunner
{
  override func doStuff(with input: String) -> String
  {
    var lines: [String.SubSequence] = []

    // Remove corrupted
    for line in input.split(separator: "\n")
    {
      if let _: Character = Day10Part1.checkForCorruption(in: String(line))
      {
        continue
      }
      else
      {
        lines.append(line)
      }
    }

    var results: [Int] = []
    for line in lines
    {
      results.append(Day10Part2.complete(line: String(line)))
    }
    results = results.sorted()

    return "\(results[(results.count)/2])"
  }

  static func complete(line: String) -> Int
  {
    var stack: [Character] = []
    for character in line
    {
      switch character
      {
      case "{":
        stack.append("}")
      case "[":
        stack.append("]")
      case "(":
        stack.append(")")
      case "<":
        stack.append(">")
      case "}", "]", ")", ">":
        _ = stack.popLast()
      default:
        assert(false, "Should not happen pancake")
      }
    }

    var total: Int = 0

    while let character = stack.popLast()
    {
      total *= 5
      switch character
      {
      case ")":
        total += 1
      case "]":
        total += 2
      case "}":
        total += 3
      case ">":
        total += 4
      default:
        assert(false, "Should not happen pancake")
      }
    }

    return total
  }

  override func cleanUp()
  {
  }
}
