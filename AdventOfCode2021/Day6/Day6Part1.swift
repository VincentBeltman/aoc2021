//
//  Day6Part1.swift
//  AdventOfCode2021
//
//  Created by Inspiro developer on 06/12/2021.
//

import Foundation

class Day6Part1: PartRunner
{
  class FishGroup
  {
    var nrOfFishes: Int = 0
    var nrOfYoung: Int = 0
    var daysLeft: Int
    init(daysLeft: Int)
    {
      self.daysLeft = daysLeft
    }
  }

  private var fishGroups: [FishGroup] = []
  var nrOfIterations: Int = 0

  override func doStuff(with input: String) -> String
  {
    for i in 0...6
    {
      fishGroups.append(FishGroup(daysLeft: i))
    }

    let parts: [String.SubSequence] = input.split(separator: ",")

    for part in parts
    {
      addToGroup(withNrOfDaysLeft: Int(part)!, isYoung: false)
    }

    for _ in 0..<nrOfIterations
    {
      iteration()
    }

    var total: Int = 0
    for group in fishGroups
    {
      total += group.nrOfYoung + group.nrOfFishes
    }

    return "\(total)"
  }

  func addToGroup(withNrOfDaysLeft daysLeft: Int, isYoung: Bool, nrOfFishesToAdd: Int = 1)
  {
    for group in fishGroups where group.daysLeft == daysLeft
    {
      if isYoung
      {
        group.nrOfYoung += nrOfFishesToAdd
      }
      else
      {
        group.nrOfFishes += nrOfFishesToAdd
      }
    }
  }

  func iteration()
  {
    for group in fishGroups
    {
      if group.daysLeft == 0
      {
        addToGroup(withNrOfDaysLeft: 2, isYoung: true, nrOfFishesToAdd: group.nrOfFishes)
        group.nrOfFishes += group.nrOfYoung
        group.nrOfYoung = 0
      }
    }
    for group in fishGroups
    {
      group.daysLeft = group.daysLeft == 0 ? 6 : group.daysLeft - 1
    }
  }

  override func cleanUp()
  {
    fishGroups.removeAll()
  }
}
