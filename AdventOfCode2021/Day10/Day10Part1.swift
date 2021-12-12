//
//  Day10Part1.swift
//  AdventOfCode2021
//
//  Created by Inspiro developer on 10/12/2021.
//

import Foundation

class Day10Part1: PartRunner
{
  override func doStuff(with input: String) -> String
  {
    var total: Int = 0
    for line in input.split(separator: "\n")
    {
      if let character: Character = Day10Part1.checkForCorruption(in: String(line))
      {
        switch character
        {
        case ")":
          total += 3
        case "]":
          total += 57
        case "}":
          total += 1197
        case ">":
          total += 25137
        default:
          assert(false, "WTf pancake")
        }
      }
    }

    return "\(total)"
  }

  static func checkForCorruption(in line: String) -> Character?
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
        if let last: Character = stack.last, last == character
        {
          _ = stack.popLast()
          continue
        }
        else
        {
          return character
        }
      default:
        assert(false, "Should not happen pancake")
      }
    }
    return nil
  }

  override func cleanUp()
  {
  }
}
