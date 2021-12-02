//
//  PartRunner.swift
//  AdventOfCode2021
//
//  Created by Inspiro developer on 01/12/2021.
//

import Foundation

class PartRunner
{
  private let verbose: Bool
  init(verbose: Bool)
  {
    self.verbose = verbose
  }

  private func timeToString(time: TimeInterval) -> Double
  {
    return Double(round(1000 * time) / 1000)
  }

  func run(input: String)
  {
    let startTime: TimeInterval = Date().timeIntervalSince1970
    print("Started at \(timeToString(time: startTime))")

    let result: String = doStuff(with: input)

    let endTime: TimeInterval = Date().timeIntervalSince1970
    print("Ended at \(timeToString(time: endTime))")
    print("Total time elapsed \(timeToString(time: endTime - startTime))")
    print("And the answer is: \(result)")
    print("")

    cleanUp()
  }

  func doStuff(with input: String) -> String
  {
    assert(false, "Do stuff not overriden")
    return ""
  }

  func cleanUp()
  {
    assert(false, "Clean up not overriden")
  }

  func log(_ string: String)
  {
    if verbose
    {
      print(string)
    }
  }
}
