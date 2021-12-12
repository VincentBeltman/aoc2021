//
//  Field.swift
//  AdventOfCode2021
//
//  Created by Inspiro developer on 05/12/2021.
//

import Foundation

typealias StringField2D = Field2D<String>
typealias IntField2D = Field2D<Int>

class Field2D<T: Comparable>
{
  class Coordinate: Equatable
  {
    var y: Int
    var x: Int

    init(y: Int, x: Int)
    {
      self.y = y
      self.x = x
    }

    static func == (lhs: Coordinate, rhs: Coordinate) -> Bool
    {
      return lhs.x == rhs.x && lhs.y == rhs.y
    }

    static func != (lhs: Coordinate, rhs: Coordinate) -> Bool
    {
      return lhs.x != rhs.x || lhs.y != rhs.y
    }
  }

  class CoordinateRange
  {
    let start: Coordinate
    let end: Coordinate

    init(start: Coordinate, end: Coordinate)
    {
      self.start = start
      self.end = end
    }
  }

  private var field: [[T]] = []
  private let defaultValue: T
  private var height: Int // For optimization purposes
  private var width: Int // For optimization purposes
  private var diagonalsEnabled: Bool

  init(defaultValue: T, enableDiagonals: Bool = false)
  {
    self.defaultValue = defaultValue
    self.height = 0
    self.width = 0
    self.diagonalsEnabled = enableDiagonals
  }

  func resize(to coordinate: Coordinate)
  {
    for i in 0...coordinate.y
    {
      if (i >= height)
      {
        field.append([])
        for _ in 0..<width
        {
          field[i].append(self.defaultValue)
        }
      }
    }
    height = Swift.max(height, coordinate.y + 1)

    for i in 0..<field.count
    {
      if (coordinate.x >= width)
      {
        for _ in width...coordinate.x
        {
          field[i].append(self.defaultValue)
        }
      }
    }
    width = Swift.max(width, coordinate.x + 1)
  }

  func getHeight() -> Int
  {
    return height
  }

  func getWidth() -> Int
  {
    return width
  }

  func setValue(_ value: T, at coordinate: Coordinate)
  {
    if (coordinate.y >= getHeight() || coordinate.x >= getWidth())
    {
      resize(to: coordinate)
    }
    field[coordinate.y][coordinate.x] = value
  }

  func setRange(_ value: T, atRange range: CoordinateRange)
  {
    alterRange(value: value, atRange: range, withMethod: setValue)
  }

  func getValue(at coordinate: Coordinate) -> T
  {
    return ((coordinate.y < height) && (coordinate.x < width)) ? field[coordinate.y][coordinate.x] : defaultValue
  }

  func getValue(at coordinate: Coordinate) -> T?
  {
    return ((coordinate.y >= 0) && (coordinate.x >= 0) && (coordinate.y < height) && (coordinate.x < width)) ? field[coordinate.y][coordinate.x] : nil
  }

  func toString() -> String
  {
    var result = ""
    for row in field
    {
      for cell in row
      {
        result.append("\(cell)")
      }
      result.append("\n")
    }
    return result
  }

  func countNrOfOccurrences(biggerThanOrEqualTo value: T) -> Int
  {
    var count: Int = 0
    for row in field
    {
      for cell in row where cell >= value
      {
        count += 1
      }
    }
    return count
  }

  private func alterRange(value: T, atRange range: CoordinateRange, withMethod alterationMethod: (T, Coordinate) -> Void)
  {
    assert((range.start.x == range.end.x) ||
           (range.start.y == range.end.y) ||
           (abs(range.start.x - range.end.x) == abs(range.start.y - range.end.y)),
           "horizontal, vertical, and 45 degrees diagonal supported only")

    let currentCoordinate: Coordinate = range.start
    alterationMethod(value, currentCoordinate)

    while currentCoordinate != range.end
    {
      if currentCoordinate.x < range.end.x
      {
        currentCoordinate.x += 1
      }
      else if currentCoordinate.x > range.end.x
      {
        currentCoordinate.x -= 1
      }

      if currentCoordinate.y < range.end.y
      {
        currentCoordinate.y += 1
      }
      else if currentCoordinate.y > range.end.y
      {
        currentCoordinate.y -= 1
      }

      alterationMethod(value, currentCoordinate)
    }
  }

  func getNeighbourCoordinates(of coordinate: Coordinate) -> [Coordinate]
  {
    var neighbourCoordinates: [Coordinate] = []

    neighbourCoordinates.append(Coordinate(y: coordinate.y-1, x: coordinate.x))
    neighbourCoordinates.append(Coordinate(y: coordinate.y, x: coordinate.x-1))
    neighbourCoordinates.append(Coordinate(y: coordinate.y+1, x: coordinate.x))
    neighbourCoordinates.append(Coordinate(y: coordinate.y, x: coordinate.x+1))

    if diagonalsEnabled
    {
      neighbourCoordinates.append(Coordinate(y: coordinate.y-1, x: coordinate.x-1))
      neighbourCoordinates.append(Coordinate(y: coordinate.y+1, x: coordinate.x-1))
      neighbourCoordinates.append(Coordinate(y: coordinate.y+1, x: coordinate.x+1))
      neighbourCoordinates.append(Coordinate(y: coordinate.y-1, x: coordinate.x+1))
    }

    return neighbourCoordinates
  }

  func getNeighbours(of coordinate: Coordinate) -> [T]
  {
    var neighbours: [T] = []
    for neighbour in getNeighbourCoordinates(of: coordinate)
    {
      if let neighbourValue: T = getValue(at: neighbour)
      {
        neighbours.append(neighbourValue)
      }
    }
    return neighbours
  }
}

extension Field2D where T: Numeric
{
  func addValue(_ value: T, at coordinate: Coordinate)
  {
    if (coordinate.y >= getHeight() || coordinate.x >= getWidth())
    {
      resize(to: coordinate)
    }
    field[coordinate.y][coordinate.x] += value
  }

  func addRange(_ value: T, atRange range: CoordinateRange)
  {
    alterRange(value: value, atRange: range, withMethod: addValue)
  }
}

extension Field2D: Sequence
{
  struct Iterator: IteratorProtocol
  {
    let field: Field2D
    let coordinate: Coordinate

    init(_ field: Field2D)
    {
      self.field = field
      self.coordinate = Coordinate(y: 0, x: 0)
    }

    mutating func next() -> Coordinate?
    {
      let nextCoordinate: Coordinate = Coordinate(y: coordinate.y, x: coordinate.x)
      coordinate.x += 1
      if field.width == coordinate.x
      {
        coordinate.x = 0
        coordinate.y += 1
      }

      return field.height == nextCoordinate.y ? nil : nextCoordinate
    }
  }

  func makeIterator() -> Iterator
  {
    return Iterator(self)
  }
}
