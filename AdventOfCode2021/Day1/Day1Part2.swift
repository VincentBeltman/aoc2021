//
//  Day1Part2.swift
//  AdventOfCode2021
//
//  Created by Inspiro developer on 01/12/2021.
//

import Foundation

class Day1Part2: PartRunner
{
  override func doStuff(with input: String) -> String
  {
    let lines: [String.SubSequence] = input.split(separator: "\n")
    var previousList: [Int] = []
    var previousCount: Int = 0
    var count: Int = 0

    for line in lines
    {
      if let number: Int = Int(line)
      {
        if previousList.count == 3
        {
          previousList.removeFirst()
          previousList.append(number)

          let newCount: Int = previousList.reduce(0, +)

          if newCount > previousCount
          {
            log("Increasing from \(previousCount) to \(newCount)")
            count += 1
          }
          else
          {
            log("Decreasing from \(previousCount) to \(newCount)")
          }

          previousCount = newCount
        }
        else
        {
          previousList.append(number)
        }
      }
    }

    return "\(count)"
  }

  override func cleanUp()
  {
  }
}
