//
//  Day4Part2.swift
//  AdventOfCode2021
//
//  Created by Inspiro developer on 02/12/2021.
//

import Foundation

class Day4Part2: PartRunner
{
  override func doStuff(with input: String) -> String
  {
    let parts: [String] = input.components(separatedBy: "\n\n")
    let balls: [Int] = parts[0].split(separator: ",").map{ Int($0)!}
    var bingoCards: [BingoCard] = []

    for i in 1..<parts.count
    {
      bingoCards.append(BingoCard(raw: parts[i]))
    }

    var lastBall: Int = 0

    for ball in balls
    {
      lastBall = ball
      var removeIndexes: [Int] = []
      for (i, bingoCard) in bingoCards.enumerated()
      {
        if bingoCard.handleNumberCalled(ball)
        {
          if bingoCard.hasBingo()
          {
            if bingoCards.count == 1
            {
              return "\(bingoCards[0].sumOfAllUnmarkedNumbers() * lastBall)"
            }
            else
            {
              removeIndexes.append(i)
            }
          }
        }
      }

      for removeIndex in removeIndexes.reversed()
      {
        bingoCards.remove(at: removeIndex)
      }
    }
    return ""
  }

  override func cleanUp()
  {
  }
}
