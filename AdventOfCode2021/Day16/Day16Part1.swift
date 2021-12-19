//
//  Day16Part1.swift
//  AdventOfCode2021
//
//  Created by Inspiro developer on 18/12/2021.
//

import Foundation

class Day16Part1: PartRunner
{
  override func doStuff(with input: String) -> String
  {
    let parser: BitsParser = BitsParser()
    let results: BitsParser.Results = parser.parse(raw: input)
    return "\(results.versionTotal)"
  }

  override func cleanUp()
  {
  }
}
