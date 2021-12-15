//
//  File.swift
//  AdventOfCode2021
//
//  Created by Inspiro developer on 15/12/2021.
//

import Foundation

class Day15Part1: PartRunner
{
  class Point: Comparable
  {
    static func < (lhs: Day15Part1.Point, rhs: Day15Part1.Point) -> Bool
    {
      return lhs.distance < rhs.distance
    }

    static func == (lhs: Day15Part1.Point, rhs: Day15Part1.Point) -> Bool
    {
      return lhs.riskFactor == rhs.riskFactor && lhs.visited == rhs.visited && lhs.distance == rhs.distance
    }

    let riskFactor: Int
    var distance: Int
    var visited: Bool
    init(riskFactor: Int)
    {
      self.riskFactor = riskFactor
      self.distance = Int.max
      self.visited = false
    }
  }

  override func doStuff(with input: String) -> String
  {
    let field: Field2D<Point> = Field2D<Point>(defaultValue: Point(riskFactor: 0))
    // TODO: Make this a method?
    
    for (y, line) in input.split(separator: "\n").enumerated()
    {
      for (x, char) in line.enumerated()
      {
        field.setValue(Point(riskFactor: char.wholeNumberValue!), at: Field2D<Point>.Coordinate(y: y, x: x))
      }
    }

    var currentCoordinate: Field2D<Point>.Coordinate = Field2D<Point>.Coordinate(y: 0, x: 0)
    var currentPoint: Point = field.getValue(at: currentCoordinate)
    currentPoint.visited = true
    currentPoint.distance = 0
    var toVisit: [Field2D<Point>.Coordinate] = []
    toVisit.append(currentCoordinate)
    var smallestDistance: Int = 0
    while (!toVisit.isEmpty)
    {
      toVisit = toVisit.filter{ $0 != (currentCoordinate) }
      currentPoint.visited = true
      // Go to each adjacent vertex and update the path length
      for neighbourCoordinate in field.getNeighbourCoordinates(of: currentCoordinate)
      {
        if let neighbourPoint: Point = field.getValue(at: neighbourCoordinate)
        {
          let newDistance = currentPoint.distance + neighbourPoint.riskFactor
          if newDistance < neighbourPoint.distance
          {
            neighbourPoint.distance = newDistance
            toVisit.append(neighbourCoordinate)
            neighbourPoint.visited = false
          }
        }
      }
      currentPoint.visited = true
      if !toVisit.isEmpty
      {
        currentCoordinate = toVisit.min(by: { (a, b) -> Bool in
          return field.getValue(at: a).distance < field.getValue(at: b).distance
        })!
        currentPoint = field.getValue(at: currentCoordinate)
      }

      if (currentCoordinate == Field2D<Point>.Coordinate(y: field.getHeight()-1, x: field.getWidth()-1))
      {
        smallestDistance = currentPoint.distance
      }
    }

    return "\(smallestDistance)"
  }

  override func cleanUp()
  {
  }
}
