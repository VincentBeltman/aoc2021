//
//  Day21Part2.swift
//  AdventOfCode2021
//
//  Created by Inspiro developer on 04/01/2022.
//

import Foundation

class Day21Part2: PartRunner
{
  struct Player
  {
    var position: Int
    var total: Int

    init (startingPosition pos: Int)
    {
      self.position = pos
      self.total = 0
    }

    init (newPosition pos: Int, currentTotal: Int)
    {
      self.position = pos
      self.total = currentTotal
    }

    mutating func move(spaces: Int)
    {
      position = (position + spaces) % 10
      if position == 0
      {
        position = 10
      }
      total += position
    }
  }

  struct Wins
  {
    var wins1: Int = 0
    var wins2: Int = 0

    init()
    {
    }

    mutating func append(_ wins: Wins, withMultiplier: Int)
    {
      wins1 += wins.wins2 * withMultiplier
      wins2 += wins.wins1 * withMultiplier
    }
  }

  override func doStuff(with input: String) -> String
  {
    let startingPositions: [String] = input.components(separatedBy: ",")
    let player1: Player = Player(startingPosition: Int(startingPositions[0])!)
    let player2: Player = Player(startingPosition: Int(startingPositions[1])!)

    let wins: Wins = play(turnPlayer: player1, waitingPlayer: player2)

    return "\(max(wins.wins1, wins.wins2))"
  }

  func play(turnPlayer: Player, waitingPlayer: Player) -> Wins // Return player1 wins and player2 wins
  {
    var wins: Wins = Wins()
    for (steps, nrOfNewUniverses) in [(3, 1),(4,3),(5,6),(6,7),(7,6),(8,3),(9,1)]
    {
      var copyTurnPlayer: Player = Player(newPosition: turnPlayer.position, currentTotal: turnPlayer.total)
      copyTurnPlayer.move(spaces: steps)
      if copyTurnPlayer.total >= 21
      {
        var newWins: Wins = Wins()
        newWins.wins1 = 0
        newWins.wins2 = nrOfNewUniverses
        wins.append(newWins, withMultiplier: 1)
      }
      else
      {
        let newWins: Wins = play(turnPlayer: waitingPlayer, waitingPlayer: copyTurnPlayer)
        wins.append(newWins, withMultiplier: nrOfNewUniverses)
      }
    }
    return wins
  }
  override func cleanUp()
  {
  }
}
