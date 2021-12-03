//
//  Day3Part1.swift
//  AdventOfCode2021
//
//  Created by Inspiro developer on 02/12/2021.
//

import Foundation

class Day3Part1: PartRunner
{
  override func doStuff(with input: String) -> String
  {
    let lines: [String.SubSequence] = input.split(separator: "\n")

    log("Running part 1 of day 3")
    var nrOfOnesPerPosition: [Double] = Array(repeating: 0, count: lines[0].count)
    let nrOfLines: Double = Double(lines.count)

    for line in lines
    {
      for (i, bit) in line.enumerated()
      {
        if bit == "1"
        {
          nrOfOnesPerPosition[i] += 1
        }
      }
    }

    let tuple: (Int, Int) = calculateRates(nrOfOnesPerPosition: nrOfOnesPerPosition, nrOfLines: nrOfLines)
    let gammaRate: Int = tuple.0
    let epsilonRate: Int = tuple.1

    print("gamme \(gammaRate) epsilon \(epsilonRate) times \(gammaRate * epsilonRate)")

    return "\(gammaRate * epsilonRate)"
  }

  override func cleanUp()
  {
  }

  func calculateRates(nrOfOnesPerPosition: [Double], nrOfLines: Double) -> (Int, Int)
  {
    var gammaRate: Int = 0
    var epsilonRate: Int = 0
    let endIndex: Int = nrOfOnesPerPosition.count - 1
    for (i, nrOfOnes) in nrOfOnesPerPosition.enumerated()
    {
      if nrOfOnes > nrOfLines/2
      {
        gammaRate += 1 << (endIndex - i)
      }
      else if nrOfOnes < nrOfLines/2
      {
        epsilonRate += 1 << (endIndex - i)
      }
    }
    return (gammaRate, epsilonRate)
  }
}
