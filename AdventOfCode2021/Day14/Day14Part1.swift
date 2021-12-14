//
//  Day14Part1.swift
//  AdventOfCode2021
//
//  Created by Inspiro developer on 14/12/2021.
//

import Foundation

class Day14Part1: PartRunner
{
  class InsertionRule
  {
    let combination: String
    let insertion: String

    init(combination: String, insertion: String)
    {
      self.combination = combination
      self.insertion = insertion
    }

    func doesMatch(_ string: String) -> Bool
    {
      return combination == string
    }

    func getInsertion() -> String
    {
      return insertion
    }
  }

  override func doStuff(with input: String) -> String
  {
    let parts: [String] = input.components(separatedBy: "\n\n")
    var polymer: String = parts[0]
    var insertionRules: [InsertionRule] = []
    for insertionRule in parts[1].split(separator: "\n")
    {
      let ruleParts: [String] = insertionRule.components(separatedBy: " -> ")
      insertionRules.append(InsertionRule(combination: ruleParts[0], insertion: ruleParts[1]))
    }

    for _ in 0..<10
    {
      var newPolymer: String = ""
      for polymerIndex in 0..<polymer.count
      {
        newPolymer.append(polymer[polymerIndex])

        if polymerIndex < polymer.count-1
        {
          let start: String.Index = polymer.index(polymer.startIndex, offsetBy: polymerIndex)
          let end: String.Index = polymer.index(polymer.startIndex, offsetBy: polymerIndex+1)

          for insertionRule in insertionRules where insertionRule.doesMatch(String(polymer[start...end]))
          {
            newPolymer.append(insertionRule.insertion)
            break
          }
        }
      }
      polymer = newPolymer
    }

    var occurrences: [Character: Int] = [:]
    for character in polymer
    {
      if occurrences[character] == nil
      {
        occurrences[character] = 0
      }
      occurrences[character]! += 1
    }

    let sortedOccurrences = occurrences.sorted { (first, second) -> Bool in
        return first.value > second.value
    }

    return "\(sortedOccurrences.first!.value - sortedOccurrences.last!.value)"
  }

  override func cleanUp()
  {
  }
}
