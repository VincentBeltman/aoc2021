//
//  Day17Part2.swift
//  AdventOfCode2021
//
//  Created by Inspiro developer on 19/12/2021.
//

import Foundation

class Day17Part2: PartRunner
{
  class Box
  {
    let x1: Int
    let x2: Int
    let y1: Int
    let y2: Int

    init(input: String)
    {
      let regex = try! NSRegularExpression(pattern: "target area: x=([-\\d]+)..([-\\d]+), y=([-\\d]+)..([-\\d]+)")
      let result: NSTextCheckingResult = regex.matches(in: input, range: NSRange(input.startIndex..., in: input)).first!
      self.x1 = Int(input[Range(result.range(at: 1), in: input)!])!
      self.x2 = Int(input[Range(result.range(at: 2), in: input)!])!
      self.y1 = Int(input[Range(result.range(at: 3), in: input)!])!
      self.y2 = Int(input[Range(result.range(at: 4), in: input)!])!
    }

    func contains(x: Int, y: Int) -> Bool
    {
      return x >= x1 && x <= x2 && y >= y1 && y <= y2
    }

    func before(x: Int, y: Int) -> Bool
    {
      return x > x2 || y < y1
    }
  }

  override func doStuff(with input: String) -> String
  {
    let box: Box = Box(input: input)

    let minXVelocity: Int = calculateMinXVelocity(box.x1)
    let maxXVelocity: Int = box.x2
    let minYVelocity: Int = box.y1
    let maxYVelocity: Int = abs(box.y1)-1

    var total: Int = 0
    for x in minXVelocity...maxXVelocity
    {
      for y in minYVelocity...maxYVelocity
      {
        if checkHit(xVelocity: x, xCurrent: 0, yVelocity: y, yCurrent: 0, in: box)
        {
          total += 1
        }
      }
    }

    return "\(total)"
  }

  func calculateMinXVelocity(_ x1: Int) -> Int
  {
    var minXVelocity: Int = 0
    var total: Int = 0
    while total < x1
    {
      minXVelocity += 1
      total += minXVelocity
    }
    return minXVelocity
  }

  func checkHit(xVelocity: Int, xCurrent: Int, yVelocity: Int, yCurrent: Int, in box: Box) -> Bool
  {
    if box.contains(x: xCurrent, y: yCurrent)
    {
      return true
    }
    else if box.before(x: xCurrent, y: yCurrent)
    {
      return false
    }

    let newX: Int = xCurrent+xVelocity
    var newXVelocity: Int = xVelocity
    if newXVelocity > 0
    {
      newXVelocity -= 1
    }
    return checkHit(xVelocity: newXVelocity, xCurrent: newX, yVelocity: yVelocity-1, yCurrent: yCurrent+yVelocity, in: box)
  }

  override func cleanUp()
  {
  }
}
