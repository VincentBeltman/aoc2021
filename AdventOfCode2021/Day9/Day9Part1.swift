//
//  Day9Part1.swift
//  AdventOfCode2021
//
//  Created by Inspiro developer on 09/12/2021.
//

import Foundation

class Day9Part1: PartRunner
{
  override func doStuff(with input: String) -> String
  {
    let field: IntField2D = IntField2D(defaultValue: 0, enableDiagonals: false)
    for (y, line) in input.split(separator: "\n").enumerated()
    {
      for (x, height) in line.enumerated()
      {
        field.addValue(height.wholeNumberValue!, at: IntField2D.Coordinate(y: y, x: x))
      }
    }

    var riskValue: Int = 0
    for coordinate in field
    {
      let neighbourValues: [Int] = field.getNeighbours(of: coordinate)
      var isSmallest = true
      let value: Int = field.getValue(at: coordinate)
      for neighbourValue in neighbourValues where neighbourValue <= value
      {
        isSmallest = false
        break
      }
      if isSmallest
      {
        riskValue += value + 1
      }
    }

    return "\(riskValue)"
  }

  override func cleanUp()
  {
  }
}
