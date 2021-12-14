//
//  Day14Part2.swift
//  AdventOfCode2021
//
//  Created by Inspiro developer on 14/12/2021.
//

import Foundation

class Day14Part2: PartRunner
{
  class Combination: Hashable, Equatable
  {
    let combination: String
    var count: Int
    init(combination: String)
    {
      self.combination = combination
      self.count = 0
    }

    static func == (lhs: Day14Part2.Combination, rhs: Day14Part2.Combination) -> Bool
    {
      return lhs.combination == rhs.combination
    }

    func hash(into hasher: inout Hasher)
    {
      hasher.combine(combination)
    }
  }

  override func doStuff(with input: String) -> String
  {
    let parts: [String] = input.components(separatedBy: "\n\n")
    let polymer: String = parts[0]
    let graph: Graph<Combination> = Graph<Combination>()
    for insertionRule in parts[1].split(separator: "\n")
    {
      let ruleParts: [String] = insertionRule.components(separatedBy: " -> ")

      var firstDirection: String = String(ruleParts[0][0])
      firstDirection.append(ruleParts[1])
      var secondDirection: String = ruleParts[1]
      secondDirection.append(String(ruleParts[0][1]))
      graph.addDirectedEdge(from: Combination(combination: ruleParts[0]), to: Combination(combination: firstDirection))
      graph.addDirectedEdge(from: Combination(combination: ruleParts[0]), to: Combination(combination: secondDirection))
    }

    for i in 0..<(polymer.count-1)
    {
      let start: String.Index = polymer.index(polymer.startIndex, offsetBy: i)
      let end: String.Index = polymer.index(polymer.startIndex, offsetBy: i+1)

      graph[Combination(combination: String(polymer[start...end]))].count += 1
    }

    for _ in 0..<40
    {
      var additions: [String: Int] = [:]
      for combination in graph.nodes()
      {
        for edge in graph.getEdges(from: combination)
        {
          if additions[edge.combination] == nil
          {
            additions[edge.combination] = 0
          }
          additions[edge.combination]! += combination.count
        }
        combination.count = 0
      }

      for addition in additions
      {
        graph[Combination(combination: addition.key)].count += addition.value
      }
    }

    var charTotals: [Character: Int] = [polymer.last!: 1]
    for combination in graph.nodes()
    {
      let char: Character = combination.combination[0]
      if charTotals[char] == nil
      {
        charTotals[char] = 0
      }
      charTotals[char]! += combination.count
    }

    let sortTotals = charTotals.sorted { (first, second) -> Bool in
        return first.value > second.value
    }

    return "\(sortTotals.first!.value - sortTotals.last!.value)"
  }

  override func cleanUp()
  {
  }
}
