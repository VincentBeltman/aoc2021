//
//  Day8Part2.swift
//  AdventOfCode2021
//
//  Created by Inspiro developer on 08/12/2021.
//

import Foundation

class Day8Part2: PartRunner
{
  class Parser
  {
    let TOP = 0
    let LEFT_TOP = 1
    let RIGHT_TOP = 2
    let MIDDLE = 3
    let LEFT_BOTTOM = 4
    let RIGHT_BOTTOM = 5
    let BOTTOM = 6

    var one: String = ""
    var two: String = ""
    var three: String = ""
    var four: String = ""
    var five: String = ""
    var six: String = ""
    var seven: String = ""
    var eight: String = ""
    var nine: String = ""
    var zero: String = ""

    init(input: String)
    {
      let digits = input.split(separator: " ")
      
      for digit in digits
      {
        let parsed: String = String(digit.sorted())
        if digit.count == 2
        { // This is 1
          one = parsed
        }
        else if digit.count == 3
        { // This is 7
          seven = parsed
        }
        else if digit.count == 4
        { // This is 4
          four = parsed
        }
        else if digit.count == 7
        { // This is 4
          eight = parsed
        }
      }

      for digit in digits where digit.count == 5
      {
        let parsed: String = String(digit.sorted())
        let fourWithoutOne: String = Day8Part2.Parser.keepUniqueOnly(a: four, b: one)
        if one == Day8Part2.Parser.keepDoubleOnly(a: parsed, b: one)
        { // This is 3
          three = parsed
        }
        else if fourWithoutOne == Day8Part2.Parser.keepDoubleOnly(a: parsed, b: fourWithoutOne)
        { // This is 5
          five = parsed
        }
        else
        { // This is 2
          two = parsed
        }
      }

      for digit in digits where digit.count == 6
      {
        let parsed: String = String(digit.sorted())
        if one != Day8Part2.Parser.keepDoubleOnly(a: parsed, b: one)
        { // This is 6
          six = parsed
        }
        else if three == Day8Part2.Parser.keepDoubleOnly(a: parsed, b: three)
        { // This is 9
          nine = parsed
        }
        else
        { // This is 0
          zero = parsed
        }
      }
    }

    func parseNumber(signal: String) -> Int
    {
      switch String(signal.sorted())
      {
      case one:
        return 1
      case two:
        return 2
      case three:
        return 3
      case four:
        return 4
      case five:
        return 5
      case six:
        return 6
      case seven:
        return 7
      case eight:
        return 8
      case nine:
        return 9
      case zero:
        return 0
      default:
        assert(false)
        return -1
      }
    }

    static func keepDoubleOnly(a: String, b: String) -> String
    {
      var result: String = ""
      for characterA in a
      {
        for characterB in b where characterA == characterB
        {
          result.append(characterA)
        }
      }
      return result
    }

    static func keepUniqueOnly(a: String, b: String) -> String
    {
      var result: String = ""
      for characterA in a
      {
        var found: Bool = false
        for characterB in b where characterA == characterB
        {
          found = true
        }
        if !found
        {
          result.append(characterA)
        }
      }
      return result
    }
  }

  override func doStuff(with input: String) -> String
  {
    let lines: [String.SubSequence] = input.split(separator: "\n")

    var total: Int = 0

    for line in lines
    {
      let parts: [String.SubSequence] = line.split(separator: "|")
      let parser: Parser = Parser(input: String(parts[0]))
      for (i, signal) in parts[1].split(separator: " ").enumerated()
      {
        total += parser.parseNumber(signal: String(signal)) * Int(pow(Double(10), Double(3 - i)))
      }

      print(total)
    }
    return "\(total)"
  }

  override func cleanUp()
  {
  }
}
