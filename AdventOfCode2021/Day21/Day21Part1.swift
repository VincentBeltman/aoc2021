//
//  File.swift
//  AdventOfCode2021
//
//  Created by Inspiro developer on 03/01/2022.
//

import Foundation

class Day21Part1: PartRunner
{
  class Player
  {
    var position: Int
    var total: Int

    init (startingPosition pos: Int)
    {
      self.position = pos
      self.total = 0
    }

    func move(spaces: Int)
    {
      position = (position + spaces) % 10
      if position == 0
      {
        position = 10
      }
      total += position
    }
  }

  override func doStuff(with input: String) -> String
  {
    let startingPositions: [String] = input.components(separatedBy: ",")
    let player1: Player = Player(startingPosition: Int(startingPositions[0])!)
    let player2: Player = Player(startingPosition: Int(startingPositions[1])!)

    var i = 1
    var turn = 1
    var temp = 0
    var dieRoles = 0
    while player1.total < 1000 && player2.total < 1000
    {
      dieRoles += 1
      temp += i
      if turn == 3
      {
        player1.move(spaces: temp)
        temp = 0
      }
      else if turn == 6
      {
        player2.move(spaces: temp)
        temp = 0
      }

      turn = turn == 6 ? 1 : turn + 1
      i = i == 100 ? 1 : i + 1
    }

    return "\(min(player1.total, player2.total) * dieRoles)"
  }

  override func cleanUp()
  {
  }
}
