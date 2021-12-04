//
//  Day4Part1.swift
//  AdventOfCode2021
//
//  Created by Inspiro developer on 02/12/2021.
//

import Foundation

class Day4Part1: PartRunner
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

    var winner: BingoCard? = nil
    var lastBall: Int = 0

    for ball in balls
    {
      lastBall = ball
      for bingoCard in bingoCards
      {
        if bingoCard.handleNumberCalled(ball)
        {
          if bingoCard.hasBingo()
          {
            winner = bingoCard
            break
          }
        }
      }

      if let _ = winner
      {
        break
      }
    }

    return "\(winner!.sumOfAllUnmarkedNumbers() * lastBall)"
  }

  override func cleanUp()
  {
  }
}
