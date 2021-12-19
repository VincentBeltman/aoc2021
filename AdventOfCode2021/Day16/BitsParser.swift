//
//  HexToBin.swift
//  AdventOfCode2021
//
//  Created by Inspiro developer on 18/12/2021.
//

import Foundation

private let LOOKUP_TABLE: [Character: [Character]] = [
  "0": ["0","0","0","0"],
  "1": ["0","0","0","1"],
  "2": ["0","0","1","0"],
  "3": ["0","0","1","1"],
  "4": ["0","1","0","0"],
  "5": ["0","1","0","1"],
  "6": ["0","1","1","0"],
  "7": ["0","1","1","1"],
  "8": ["1","0","0","0"],
  "9": ["1","0","0","1"],
  "A": ["1","0","1","0"],
  "B": ["1","0","1","1"],
  "C": ["1","1","0","0"],
  "D": ["1","1","0","1"],
  "E": ["1","1","1","0"],
  "F": ["1","1","1","1"]
]

class BitsParser
{
  class Results
  {
    let versionTotal: Int
    let usedLength: Int
    let totalValue: Int
    init(versionTotal: Int, usedLength: Int, totalValue: Int)
    {
      self.versionTotal = versionTotal
      self.usedLength = usedLength
      self.totalValue = totalValue
    }
  }

  enum PacketType: Int
  {
    case SUM = 0
    case PRODUCT = 1
    case MINIMUM = 2
    case MAXIMUM = 3
    case LITERAL_VALUE = 4
    case GREATER = 5
    case LESSER = 6
    case EQUAL = 7
  }

  func parse(raw: String) -> Results
  {
    var bits: [Character] = []
    for char in raw
    {
      bits += LOOKUP_TABLE[char]!
    }

    return parse(bits: bits)
  }

  private func parse(bits: [Character]) -> Results
  {
    var currentIndex: Int = 0
    var totalValue: Int = 0

    var versionTotal: Int = getInt(outOf: bits, from: currentIndex, withLength: 3)
    currentIndex += 3

    let type: Int = getInt(outOf: bits, from: currentIndex, withLength: 3)
    currentIndex += 3

    if type == PacketType.LITERAL_VALUE.rawValue
    {
      var hasNext: Bool = true
      var number: [Character] = []
      while hasNext
      {
        if bits[currentIndex] == "0"
        {
          hasNext = false
        }
        currentIndex += 1

        number += [Character](bits[currentIndex..<(currentIndex+4)])
        currentIndex += 4
      }
      totalValue += getInt(outOf: number, from: 0, withLength: number.count)
    }
    else
    {
      let lengthType: Character = bits[currentIndex]
      var values: [Int] = []
      currentIndex += 1

      if lengthType == "0"
      { // Length type 15
        var length: Int = getInt(outOf: bits, from: currentIndex, withLength: 15)
        currentIndex += 15

        while length > 0
        {
          let results: Results = parse(bits: [Character](bits[currentIndex..<bits.count]))
          versionTotal += results.versionTotal
          currentIndex += results.usedLength
          values.append(results.totalValue)
          length -= results.usedLength
        }
      }
      else
      { // Length type 11
        let length: Int = getInt(outOf: bits, from: currentIndex, withLength: 11)
        currentIndex += 11

        for _ in 0..<length
        {
          let results: Results = parse(bits: [Character](bits[currentIndex..<bits.count]))
          versionTotal += results.versionTotal
          currentIndex += results.usedLength
          values.append(results.totalValue)
        }
      }

      switch PacketType(rawValue: type)
      {
      case .SUM:
        totalValue += values.reduce(0, +)
      case .PRODUCT:
        totalValue += values.reduce(1, *)
      case .MINIMUM:
        totalValue += values.min()!
      case .MAXIMUM:
        totalValue += values.max()!
      case .GREATER:
        assert(values.count == 2)
        totalValue += values[0] > values[1] ? 1 : 0
      case .LESSER:
        assert(values.count == 2)
        totalValue += values[0] < values[1] ? 1 : 0
      case .EQUAL:
        assert(values.count == 2)
        totalValue += values[0] == values[1] ? 1 : 0
      default:
        assert(false)
      }
    }

    return Results(versionTotal: versionTotal, usedLength: currentIndex, totalValue: totalValue)
  }

  func getInt(outOf bits: [Character], from fromIndex: Int, withLength length: Int) -> Int
  {
    let range: [Character] = [Character](bits[fromIndex..<(fromIndex+length)])
    var result: Int = 0
    for (i, character) in range.enumerated() where character == "1"
    {
      result += 1 << (range.count-i-1)
    }
    return result
  }
}
