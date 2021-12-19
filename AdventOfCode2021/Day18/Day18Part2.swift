//
//  Day18Part2.swift
//  AdventOfCode2021
//
//  Created by Inspiro developer on 19/12/2021.
//

import Foundation

class Day18Part2: PartRunner
{
  override func doStuff(with input: String) -> String
  {
    let lines = input.split(separator: "\n")
    var maxMagnitude: Int = 0

    for i in 0..<lines.count
    {
      for j in 0..<lines.count where i != j
      {
        let snailMath: SnailMath = SnailMath()
        snailMath.add(raw: String(lines[i]))
        snailMath.add(raw: String(lines[j]))
        maxMagnitude = max(snailMath.magnitude, maxMagnitude)
      }
    }

    return "\(maxMagnitude)"
  }

  override func cleanUp()
  {
  }
}
