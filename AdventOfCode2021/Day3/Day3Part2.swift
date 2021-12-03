//
//  Day3Part2.swift
//  AdventOfCode2021
//
//  Created by Inspiro developer on 02/12/2021.
//

import Foundation

class Day3Part2: PartRunner
{
  override func doStuff(with input: String) -> String
  {
    var lines: [String.SubSequence] = input.split(separator: "\n")

    log("Running part 2 of day 3")

    for bitIndex in 0..<lines[0].count where lines.count > 1
    {
      let nrOfOnes: Double = Double(getNrOfOnes(from: lines, at: bitIndex))
      if nrOfOnes >= Double(lines.count)/2
      {
        removeAll(from: &lines, withChar: "0", at: bitIndex)
      }
      else
      {
        removeAll(from: &lines, withChar: "1", at: bitIndex)
      }
    }
    let oxygenGeneratorRating: Int = binaryToInt(binaryString: String(lines[0]))

    lines = input.split(separator: "\n")
    for bitIndex in 0..<lines[0].count where lines.count > 1
    {
      let nrOfOnes: Double = Double(getNrOfOnes(from: lines, at: bitIndex))
      if nrOfOnes >= Double(lines.count)/2
      {
        removeAll(from: &lines, withChar: "1", at: bitIndex)
      }
      else
      {
        removeAll(from: &lines, withChar: "0", at: bitIndex)
      }
    }
    let co2ScrubberRating: Int = binaryToInt(binaryString: String(lines[0]))

    log("oxygenGeneratorRating: \(oxygenGeneratorRating)")
    log("co2ScrubberRating: \(co2ScrubberRating)")
    return "\(oxygenGeneratorRating * co2ScrubberRating)"
  }

  override func cleanUp()
  {
  }

  func getNrOfOnes(from lines: [String.SubSequence], at bitIndex: Int) -> Int
  {
    var nrOfOnes: Int = 0
    for line in lines
    {
      if line[line.index(line.startIndex, offsetBy: bitIndex)] == "1"
      {
        nrOfOnes += 1
      }
    }
    return nrOfOnes
  }

  func removeAll(from lines: inout [String.SubSequence], withChar character: Character, at bitIndex: Int)
  {
    var removeIndex: Int = 0
    while removeIndex < lines.count
    {
      let line: String.SubSequence = lines[removeIndex]
      if line[line.index(line.startIndex, offsetBy: bitIndex)] == character
      {
        lines.remove(at: removeIndex)
      }
      else
      {
        removeIndex += 1
      }
    }
  }

  func binaryToInt(binaryString: String) -> Int
  {
    var result: Int = 0
    let endIndex: Int = binaryString.count - 1
    for (i, bit) in binaryString.enumerated()
    {
      if bit == "1"
      {
        result += 1 << (endIndex - i)
      }
    }
    return result
  }
}
