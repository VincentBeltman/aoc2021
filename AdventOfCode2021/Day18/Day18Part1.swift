//
//  Day18Part1.swift
//  AdventOfCode2021
//
//  Created by Inspiro developer on 19/12/2021.
//

import Foundation

class Day18Part1: PartRunner
{
  override func doStuff(with input: String) -> String
  {
    let snailMath: SnailMath = SnailMath()
    for line in input.split(separator: "\n")
    {
      snailMath.add(raw: String(line))
    }

    return "\(snailMath.magnitude)"
  }

  override func cleanUp()
  {
  }
}
