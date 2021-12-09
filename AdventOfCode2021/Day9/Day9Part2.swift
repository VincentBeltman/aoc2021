//
//  Day9Part2.swift
//  AdventOfCode2021
//
//  Created by Inspiro developer on 09/12/2021.
//

import Foundation

class Day9Part2: PartRunner
{
  class Point: Comparable, CustomStringConvertible
  {
    let height: Int
    var group: Int?
    var description: String
    {
      return "(\(height), \(group ?? 0)) "
    }

    init(height: Int)
    {
      self.height = height
      self.group = nil
    }

    static func < (lhs: Day9Part2.Point, rhs: Day9Part2.Point) -> Bool
    {
      return lhs.height < rhs.height
    }

    static func == (lhs: Day9Part2.Point, rhs: Day9Part2.Point) -> Bool
    {
      return lhs.height == rhs.height
    }
  }

  override func doStuff(with input: String) -> String
  {
    let field: Field2D<Point> = Field2D<Point>(defaultValue: Point(height: 0), enableDiagonals: false)
    for (y, line) in input.split(separator: "\n").enumerated()
    {
      for (x, height) in line.enumerated()
      {
        field.setValue(Point(height: height.wholeNumberValue!), at: Field2D<Point>.Coordinate(y: y, x: x))
      }
    }

    var groupNr: Int = 1
    for coordinate in field
    {
      let point: Point = field.getValue(at: coordinate)
      var newGroup: Int? = nil
      if point.height < 9
      {
        for neighbour in field.getNeighbours(of: coordinate)
        {
          if let group = neighbour.group
          {
            if let newGroup = newGroup
            {
              for updateCoordinate in field
              {
                let updatePoint: Point = field.getValue(at: updateCoordinate)
                if updatePoint.group == group
                {
                  updatePoint.group = newGroup
                  field.setValue(updatePoint, at: updateCoordinate)
                }
              }
            }
            else
            {
              newGroup = group
            }
          }
        }

        if let newGroup = newGroup
        {
          point.group = newGroup
        }
        else
        {
          point.group = groupNr
          field.setValue(point, at: coordinate)
          groupNr += 1
        }
      }
    }

    var results: [Int: Int] = [:]
    for coordinate in field
    {
      let point: Point = field.getValue(at: coordinate)

      if let group = point.group
      {
        results[group] = (results[group] == nil) ? 1 : results[group]! + 1
      }
    }

    let sortedResults: [(Int, Int)] = results.sorted(by: {$0.1 > $1.1})


    return "\(sortedResults[0].1 * sortedResults[1].1 * sortedResults[2].1)"
  }

  override func cleanUp()
  {
  }
}
