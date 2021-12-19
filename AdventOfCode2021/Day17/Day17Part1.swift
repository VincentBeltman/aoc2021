//
//  Day17Part1.swift
//  AdventOfCode2021
//
//  Created by Inspiro developer on 19/12/2021.
//

import Foundation

class Day17Part1: PartRunner
{
  override func doStuff(with input: String) -> String
  {
    let regex = try! NSRegularExpression(pattern: "target area: x=([-\\d]+)..([-\\d]+), y=([-\\d]+)..([-\\d]+)")
    let result: NSTextCheckingResult = regex.matches(in: input, range: NSRange(input.startIndex..., in: input)).first!
    let x1: Int = Int(input[Range(result.range(at: 1), in: input)!])!
    let x2: Int = Int(input[Range(result.range(at: 2), in: input)!])!
    let y1: Int = Int(input[Range(result.range(at: 3), in: input)!])!
    let y2: Int = Int(input[Range(result.range(at: 4), in: input)!])!

    print("\(x1),\(x2),\(y1),\(y2)")

    var xVelocity: Int = 0
    let yVelocity: Int = abs(y1)-1
    var total: Int = 0
    while total < x1
    {
      xVelocity += 1
      total += xVelocity
    }

    print(xVelocity, yVelocity)

    var totalHeight: Int = 0
    for i in 1...yVelocity
    {
      totalHeight += i
    }
    
    return "\(totalHeight)"
  }

  override func cleanUp()
  {
  }
}
