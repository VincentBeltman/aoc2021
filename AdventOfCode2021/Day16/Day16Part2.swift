//
//  Day16Part2.swift
//  AdventOfCode2021
//
//  Created by Inspiro developer on 18/12/2021.
//

import Foundation

class Day16Part2: PartRunner
{
  override func doStuff(with input: String) -> String
  {
    let parser: BitsParser = BitsParser()
    let results: BitsParser.Results = parser.parse(raw: input)
    return "\(results.totalValue)"
  }

  override func cleanUp()
  {
  }
}
