//
//  Day12Part2.swift
//  AdventOfCode2021
//
//  Created by Inspiro developer on 12/12/2021.
//

import Foundation

class Day12Part2: PartRunner
{
  override func doStuff(with input: String) -> String
  {
    let graph: Graph<String> = Graph<String>(delegate: shouldEnterCave)
    for line in input.split(separator: "\n")
    {
      let parts: [String.SubSequence] = line.split(separator: "-")
      graph.addEdgeBetween(x: String(parts[0]), y: String(parts[1]))
    }

    let numberOfPaths: Int = graph.findNumberOfPaths(from: ["start"], to: "end")

    return "\(numberOfPaths)"
  }

  func shouldEnterCave(from currentPath: [String], to caveToEnter: String) -> Bool
  {
    var shouldEnter: Bool = caveToEnter.isInAllCaps
    if !shouldEnter && caveToEnter != currentPath.first!
    {
      var duplicates: [String] = []
      var hasDuplicateAlready: Bool = false
      var containsCave: Bool = false
      for cave in currentPath where !cave.isInAllCaps
      {
        if duplicates.contains(cave)
        {
          hasDuplicateAlready = true
        }
        else
        {
          duplicates.append(cave)
        }

        if cave == caveToEnter
        {
          containsCave = true
        }
      }

      shouldEnter = !containsCave || !hasDuplicateAlready
    }
    return shouldEnter
  }

  override func cleanUp()
  {
  }
}
