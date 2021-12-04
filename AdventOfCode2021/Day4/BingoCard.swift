//
//  BingoCard.swift
//  AdventOfCode2021
//
//  Created by Inspiro developer on 04/12/2021.
//

import Foundation

class BingoCard
{
  private var card: [[(Int, Bool)]] = []

  init(raw: String)
  {
    let rows: [String.SubSequence] = raw.split(separator: "\n")
    for (rowIndex, row) in rows.enumerated()
    {
      let cells: [String.SubSequence] = row.split(separator: " ")
      card.append([])
      for cell in cells
      {
        if let number: Int = Int(cell)
        {
          card[rowIndex].append((number, false))
        }
      }
    }
  }

  func printCard()
  {
    for row in card
    {
      for (number, isset) in row
      {
        print("\(number), \(isset)")
      }
    }
  }

  func handleNumberCalled(_ calledNumber: Int) -> Bool
  {
    for (i, row) in card.enumerated()
    {
      for (j, cell) in row.enumerated() where cell.0 == calledNumber
      {
        card[i][j] = (cell.0, true)
        return true
      }
    }

    return false
  }

  func hasBingo() -> Bool
  {
    var columnMatch: [Bool] = Array(repeating: true, count: card[0].count)

    for row in card
    {
      var rowMatch: Bool = true
      for (i, cell) in row.enumerated()
      {
        if cell.1 == false
        {
          rowMatch = false
          columnMatch[i] = false
        }
      }

      if rowMatch
      {
        return true
      }
    }

    for column in columnMatch where column
    {
      return column
    }

    return false
  }

  func sumOfAllUnmarkedNumbers() -> Int
  {
    var sum: Int = 0
    for row in card
    {
      for cell in row where !cell.1
      {
        sum += cell.0
      }
    }

    return sum
  }
}
