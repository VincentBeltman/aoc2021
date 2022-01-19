//
//  Day22Part2.swift
//  AdventOfCode2021
//
//  Created by Inspiro developer on 04/01/2022.
//

import Foundation

class Day22Part2: PartRunner
{

  struct RangeSet
  {
    var xRangeStart: Int
    var xRangeEnd: Int
    var yRangeStart: Int
    var yRangeEnd: Int
    var zRangeStart: Int
    var zRangeEnd: Int
    var offRanges: [RangeSet]

    init(coordRanges: [String.SubSequence])
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
      assert(xRangeStart <= xRangeEnd)
      assert(yRangeStart <= yRangeEnd)
      assert(zRangeStart <= zRangeEnd)
      self.offRanges = []
    }

    init(xRangeStart: Int, xRangeEnd: Int, yRangeStart: Int, yRangeEnd: Int, zRangeStart: Int, zRangeEnd: Int)
    {
      self.xRangeStart = xRangeStart
      self.xRangeEnd = xRangeEnd
      self.yRangeStart = yRangeStart
      self.yRangeEnd = yRangeEnd
      self.zRangeStart = zRangeStart
      self.zRangeEnd = zRangeEnd
      self.offRanges = []
    }

    private static func parse(coordRange: String.SubSequence) -> (Int, Int)
    {
      let parts: [String] = coordRange.split(separator: "=")[1].components(separatedBy: "..")
      return (Int(parts[0])!, Int(parts[1])!)
    }

    mutating func removeOverlaps(with range: RangeSet)
    {
      let newOffRange: RangeSet = RangeSet(
        xRangeStart: max(self.xRangeStart, range.xRangeStart),
        xRangeEnd: min(self.xRangeEnd, range.xRangeEnd),
        yRangeStart: max(self.yRangeStart, range.yRangeStart),
        yRangeEnd: min(self.yRangeEnd, range.yRangeEnd),
        zRangeStart: max(self.zRangeStart, range.zRangeStart),
        zRangeEnd: min(self.zRangeEnd, range.zRangeEnd))

      if newOffRange.isValid()
      {
        for i in 0..<offRanges.count
        {
          offRanges[i].removeOverlaps(with: newOffRange)
        }

        offRanges.append(newOffRange)
      }
    }

    func getVolume() -> Int
    {
      var volume: Int = (self.xRangeEnd - self.xRangeStart + 1) * (self.yRangeEnd - self.yRangeStart + 1) * (self.zRangeEnd - self.zRangeStart + 1)

      for range in offRanges
      {
        volume -= range.getVolume()
      }

      return volume
    }

    func isValid() -> Bool
    {
      return xRangeStart <= xRangeEnd && yRangeStart <= yRangeEnd && zRangeStart <= zRangeEnd
    }
  }

  override func doStuff(with input: String) -> String
  {
    var ranges: [RangeSet] = []
    for line in input.split(separator: "\n")
    {
      let parts: [String.SubSequence] = line.split(separator: " ")
      let isOn: Bool = parts[0] == "on"
      let newRange: RangeSet = RangeSet(coordRanges: parts[1].split(separator: ","))

      for i in 0..<ranges.count
      {
        ranges[i].removeOverlaps(with: newRange)
      }

      if isOn
      {
        ranges.append(newRange)
      }
    }

    var totalVolume: Int = 0
    for range in ranges
    {
      totalVolume += range.getVolume()
    }

    return "\(totalVolume)"
  }

  override func cleanUp()
  {
  }
}
