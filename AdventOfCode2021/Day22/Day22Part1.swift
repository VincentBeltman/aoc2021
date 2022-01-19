//
//  Day22Part1.swift
//  AdventOfCode2021
//
//  Created by Inspiro developer on 04/01/2022.
//

import Foundation

class Day22Part1: PartRunner
{

  struct RangeSet
  {
    var xRangeStart: Int
    var xRangeEnd: Int
    var yRangeStart: Int
    var yRangeEnd: Int
    var zRangeStart: Int
    var zRangeEnd: Int
    let isOn: Bool

    init(coordRanges: [String.SubSequence], isOn: Bool)
    {
      let xRange: (Int, Int) = RangeSet.parse(coordRange: coordRanges[0])
      let yRange: (Int, Int) = RangeSet.parse(coordRange: coordRanges[1])
      let zRange: (Int, Int) = RangeSet.parse(coordRange: coordRanges[2])

      self.xRangeStart = xRange.0
      self.xRangeEnd = xRange.1
      self.yRangeStart = yRange.0
      self.yRangeEnd = yRange.1
      self.zRangeStart = zRange.0
      self.zRangeEnd = zRange.1
      self.isOn = isOn
    }

    private static func parse(coordRange: String.SubSequence) -> (Int, Int)
    {
      let parts: [String] = coordRange.split(separator: "=")[1].components(separatedBy: "..")
      return (Int(parts[0])!, Int(parts[1])!)
    }

    mutating func include(range newRange: RangeSet)
    {
      self.xRangeStart = min(self.xRangeStart, newRange.xRangeStart)
      self.xRangeEnd = max(self.xRangeEnd, newRange.xRangeEnd)
      self.yRangeStart = min(self.yRangeStart, newRange.yRangeStart)
      self.yRangeEnd = max(self.xRangeEnd, newRange.xRangeEnd)
      self.zRangeStart = min(self.zRangeStart, newRange.zRangeStart)
      self.zRangeEnd = max(self.xRangeEnd, newRange.xRangeEnd)
    }

    func contains(x: Int, y: Int, z: Int) -> Bool
    {
      return (x >= xRangeStart && x <= xRangeEnd) && (y >= yRangeStart && y <= yRangeEnd) && (z >= zRangeStart && z <= zRangeEnd)
    }
  }

  override func doStuff(with input: String) -> String
  {
    var ranges: [RangeSet] = []
    var biggestRange: RangeSet? = nil
    for line in input.split(separator: "\n")
    {
      let parts: [String.SubSequence] = line.split(separator: " ")
      let newRange: RangeSet = RangeSet(coordRanges: parts[1].split(separator: ","), isOn: parts[0] == "on")
      ranges.append(newRange)
      if biggestRange == nil
      {
        biggestRange = newRange
      }
      else
      {
        biggestRange!.include(range: newRange)
      }
    }

    var total: Int = 0
    for x in -50...50
    {
      for y in -50...50
      {
        for z in -50...50
        {
          for range in ranges.reversed() where range.contains(x: x, y: y, z: z)
          {
            total += range.isOn ? 1 : 0
            break
          }
        }
      }
    }

    return "\(total)"
  }

  override func cleanUp()
  {
  }
}
