//
//  AmphipodBurrow.swift
//  AdventOfCode2021
//
//  Created by Inspiro developer on 07/01/2022.
//

import Foundation

class AmphipodBurrow
{
  enum Occupant: Character
  {
    case Amber = "A"
    case Bronze = "B"
    case Copper = "C"
    case Desert = "D"
    case None = "."

    func toHallIndex() -> Int
    {
      switch self
      {
      case .Amber:
        return 0
      case .Bronze:
        return 1
      case .Copper:
        return 2
      case .Desert:
        return 3
      default:
        fatalError()
      }
    }
  }

  class Hall
  {
    var occupants: [Occupant]
    let correctOccupant: Occupant
    let hallwayIndex: Int

    init(raw: String, meantFor occupant: Occupant, hallwayIndex: Int)
    {
      self.occupants = []
      self.correctOccupant = occupant
      for amphipod in raw
      {
        self.occupants.append(Occupant(rawValue: amphipod)!)
      }
      self.hallwayIndex = hallwayIndex
    }

    func findFirstWrongOccupant() -> Int?
    {
      for (i, occupant) in occupants.enumerated()
      {
        if occupant == correctOccupant
        {
          for j in (i+1)..<occupants.count where occupants[j] != correctOccupant
          {
            return i
          }
        }
        else if occupant != .None
        {
          return i
        }
      }
      return nil
    }

    func receive(occupant: Occupant)
    {
      for i in stride(from: occupants.count-1, through: 0, by: -1) where occupants[i] == .None
      {
        occupants[i] = occupant
      }
    }
  }

  private var halls: [Hall]
  var hallway: [Occupant]

  init(amberRoom: String, bronzeRoom: String, copperRoom: String, desertRoom: String)
  {
    self.halls = [Hall(raw: amberRoom, meantFor: .Amber, hallwayIndex: 2),
                  Hall(raw: bronzeRoom, meantFor: .Bronze, hallwayIndex: 4),
                  Hall(raw: copperRoom, meantFor: .Copper, hallwayIndex: 6),
                  Hall(raw: desertRoom, meantFor: .Desert, hallwayIndex: 8)]
    self.hallway = [Occupant](repeating: .None, count: 11)
  }

  private func findReachableOpenSpacesInHallway(from: Int) -> [Int]
  {
    var openSpaces: [Int] = []

    if hallway[from-1] == .None
    {
      openSpaces.append(from-1)

      if from == 2
      {
        if hallway[0] == .None
        {
          openSpaces.append(0)
        }
      }
      else
      {
        openSpaces += findReachableOpenSpacesInHallway(from: from-2)
      }
    }

    if hallway[from+1] == .None
    {
      openSpaces.append(from+1)

      if from == 8
      {
        if hallway[10] == .None
        {
          openSpaces.append(10)
        }
      }
      else
      {
        openSpaces += findReachableOpenSpacesInHallway(from: from+2)
      }
    }

    return openSpaces
  }

  func moveStubbornAmphipods()
  {
    var toVisit: [] = []

    for (i, occupant) in hallway.enumerated() where occupant != .None
    {
      let hall: Hall = halls[occupant.toHallIndex()]
      if hall.findFirstWrongOccupant() == nil
      {
        let smallest = hall.hallwayIndex > i ? i : hall.hallwayIndex
        let biggest = hall.hallwayIndex < i ? i : hall.hallwayIndex

        var blocked: Bool = false
        for j in (smallest+1)..<biggest where hallway[j] != .None
        {
          blocked = true
          break
        }

        if !blocked
        {
          hallway[i] = .None
          hall.receive(occupant: occupant)
          // TODO: Add to score
        }
      }
    }

    for hall in halls
    {
      if let firstWrongOccupantIndex: Int = hall.findFirstWrongOccupant()
      {
        for reachablePlace in findReachableOpenSpacesInHallway(from: hall.hallwayIndex)
        {
          // TODO: Move, add to score and call again
        }
      }
    }

//    var toVisit: [] = []
//    toVisit.append(currentCoordinate)
//    var smallestDistance: Int = 0
//    while (!toVisit.isEmpty)
//    {
  }
}
