//
//  Day12Part1.swift
//  AdventOfCode2021
//
//  Created by Inspiro developer on 12/12/2021.
//

import Foundation

class Day12Part1: PartRunner
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
    return !currentPath.contains(caveToEnter) || caveToEnter.isInAllCaps
  }

  override func cleanUp()
  {
  }
}
