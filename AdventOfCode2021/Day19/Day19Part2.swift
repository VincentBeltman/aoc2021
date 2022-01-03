//
//  Day19Part1.swift
//  AdventOfCode2021
//
//  Created by Inspiro developer on 22/12/2021.
//

import Foundation

class Day19Part2: PartRunner
{
  class Coordinate: CustomStringConvertible, Hashable
  {
    var x: Int = 0
    var y: Int = 0
    var z: Int = 0
    var description: String
    {
      return "\(x),\(y),\(z)"
    }

    init(x: Int, y: Int, z: Int)
    {
      self.x = x
      self.y = y
      self.z = z
    }

    func rotation(at index: Int) -> Coordinate
    {
      switch index
      {
        // rotate around x axis
        case  0: return Coordinate(x:  x, y:  y, z:  z)
        case  1: return Coordinate(x:  x, y:  z, z: -y)
        case  2: return Coordinate(x:  x, y: -y, z: -z)
        case  3: return Coordinate(x:  x, y: -z, z:  y)
        // rotate around y axis
        case  4: return Coordinate(x: -y, y:  x, z:  z)
        case  5: return Coordinate(x: -z, y:  x, z: -y)
        case  6: return Coordinate(x:  y, y:  x, z: -z)
        case  7: return Coordinate(x:  z, y:  x, z:  y)
        // rotate around z axis
        case  8: return Coordinate(x: -z, y:  y, z:  x)
        case  9: return Coordinate(x:  y, y:  z, z:  x)
        case 10: return Coordinate(x:  z, y: -y, z:  x)
        case 11: return Coordinate(x: -y, y: -z, z:  x)
        // rotate around -x axis
        case 12: return Coordinate(x: -x, y:  y, z: -z)
        case 13: return Coordinate(x: -x, y:  z, z:  y)
        case 14: return Coordinate(x: -x, y: -y, z:  z)
        case 15: return Coordinate(x: -x, y: -z, z: -y)
        // rotate around -y axis
        case 16: return Coordinate(x:  y, y: -x, z:  z)
        case 17: return Coordinate(x: -z, y: -x, z:  y)
        case 18: return Coordinate(x: -y, y: -x, z: -z)
        case 19: return Coordinate(x:  z, y: -x, z: -y)
        // rotate around -z axis
        case 20: return Coordinate(x:  z, y:  y, z: -x)
        case 21: return Coordinate(x:  y, y: -z, z: -x)
        case 22: return Coordinate(x: -z, y: -y, z: -x)
        case 23: return Coordinate(x: -y, y:  z, z: -x)
        default: fatalError()
      }
    }

    func withOffset(_ offset: Coordinate) -> Coordinate
    {
      return Coordinate(x: x + offset.x, y: y + offset.y, z: z + offset.z)
    }

    func hash(into hasher: inout Hasher)
    {
      hasher.combine(x)
      hasher.combine(y)
      hasher.combine(z)
    }

    static func == (lhs: Coordinate, rhs: Coordinate) -> Bool
    {
      // TODO: This is not really good
      return lhs.x == rhs.x && lhs.y == rhs.y && lhs.z == rhs.z
    }
  }

  class Edge: CustomStringConvertible
  {
    var a: Coordinate
    var b: Coordinate
    let directDistance: Double
    var description: String {
      return "\(a) <=> \(b) ... \(directDistance)"
    }
    init(a: Coordinate, b: Coordinate)
    {
      self.a = a
      self.b = b
      let xDiff: Int = abs(a.x - b.x)
      let xDiffSquared: Int = xDiff * xDiff
      let yDiff: Int = abs(a.y - b.y)
      let yDiffSquared: Int = yDiff * yDiff
      let zDiff: Int = abs(a.z - b.z)
      let zDiffSquared: Int = zDiff * zDiff
      self.directDistance = Double(xDiffSquared + yDiffSquared + zDiffSquared).squareRoot()
    }

    func xDiff() -> Int
    {
      return a.x - b.x
    }

    func yDiff() -> Int
    {
      return a.y - b.y
    }

    func zDiff() -> Int
    {
      return a.z - b.z
    }

    func tryMatch(_ them: Edge, addTo matchMap: inout [Int: (Set<Coordinate>, Coordinate)])
    {
      for i in 0...23
      {
        let themRotated: Edge = them.rotation(at: i)

        if themRotated.xDiff() == xDiff() &&
           themRotated.yDiff() == yDiff() &&
           themRotated.zDiff() == zDiff()
        {
          if matchMap[i] == nil
          {
            matchMap[i] = (Set(), Coordinate(x: a.x - themRotated.a.x, y: a.y - themRotated.a.y, z: a.z - themRotated.a.z))
          }

          matchMap[i]!.0.insert(them.a)
          matchMap[i]!.0.insert(them.b)
        }
      }
    }

    func rotation(at index: Int) -> Edge
    {
      return Edge(a: a.rotation(at: index), b: b.rotation(at: index))
    }

    func withOffset(_ offset: Coordinate) -> Edge
    {
      return Edge(a: a.withOffset(offset), b: b.withOffset(offset))
    }
  }

  class Scanner
  {
    var edges: [Edge] = []
    private let TIPPING_POINT: Int = 11

    func tryCombine(with their: Scanner) -> Coordinate?
    {
      var combined: Bool = false
      var myIndex: Int = 0
      var theirIndex: Int = 0
      var matches: [Int: (Set<Coordinate>, Coordinate)] = [:]
      var offset: Coordinate? = nil

      //TODO: TIPPING_POINT
      while myIndex < self.edges.count && theirIndex < their.edges.count
      {
        let myEdge: Edge = self.edges[myIndex]
        let theirEdge: Edge = their.edges[theirIndex]
        if myEdge.directDistance == theirEdge.directDistance
        {
          myEdge.tryMatch(theirEdge, addTo: &matches)
          theirIndex += 1
          myIndex += 1
        }
        else if myEdge.directDistance > theirEdge.directDistance
        {
          theirIndex += 1
        }
        else
        {
          myIndex += 1
        }
      }

      if let skip: (Int, (Set<Coordinate>, Coordinate)) = matches.max(by: { a, b in a.value.0.count < b.value.0.count})
      {
        let rotationIndex: Int = skip.0
        let matchedCoordinates: Set<Coordinate> = skip.1.0
        if matchedCoordinates.count >= TIPPING_POINT
        {
          offset = skip.1.1
          combined = true
          for theirEdge in their.edges
          {
            // TODO: Don't add edges that are way too big
            if !(matchedCoordinates.contains(theirEdge.a) && matchedCoordinates.contains(theirEdge.b))
            {
              var insertIndex: Int = 0
              for myEdge in edges
              {
                if myEdge.directDistance > theirEdge.directDistance
                {
                  break
                }
                insertIndex += 1
              }

              edges.insert(theirEdge.rotation(at: rotationIndex).withOffset(offset!), at: insertIndex)
            }
          }
        }
      }
      return offset
    }
  }

  override func doStuff(with input: String) -> String
  {
    var scanners: [Int: Scanner] = [:]
    log("Start parsing")
    for (scannerIndex, scanner) in input.components(separatedBy: "\n\n").enumerated()
    {
      var coordinates: [Coordinate] = []
      for (i, line) in scanner.split(separator: "\n").enumerated() where i > 0
      {
        let parts = line.split(separator: ",")
        coordinates.append(Coordinate(x: Int(parts[0])!, y: Int(parts[1])!, z: Int(parts[2])!))
      }
      let newScanner: Scanner = Scanner()
      // TODO: No doubles
      for i in 0..<coordinates.count
      {
        for j in (i+1)..<coordinates.count
        {
          let newEdge: Edge = Edge(a: coordinates[i], b: coordinates[j])
          var index: Int = 0
          for edge in newScanner.edges
          {
            if edge.directDistance > newEdge.directDistance
            {
              break
            }
            index += 1
          }
          newScanner.edges.insert(newEdge, at: index)
        }
      }
      scanners[scannerIndex] = newScanner
    }

    log("Start Merging")
    let map: Scanner = scanners.removeValue(forKey: 0)!
    var scannerCoordinates: [Int: Coordinate] = [0: Coordinate(x: 0, y: 0, z: 0)]
    while !scanners.isEmpty
    {
      var remove: [Int] = []
      for (i, scanner) in scanners
      {
        log("Try combine scanner \(i)")
        if let offset: Coordinate = map.tryCombine(with: scanner)
        {
          scannerCoordinates[i] = Coordinate(x: offset.x, y: offset.y, z: offset.z)
          remove.insert(i, at: 0)
        }
      }

      for i in remove
      {
        log("Combined \(i)")
        scanners.removeValue(forKey: i)
      }
    }

    log("Calculating manhattan distance")
    var highestManhattanDistance: Int = 0
    for i in 0..<(scannerCoordinates.count-1)
    {
      for j in (i+1)..<scannerCoordinates.count
      {
        let manhattan: Int = abs(scannerCoordinates[i]!.x - scannerCoordinates[j]!.x) + abs(scannerCoordinates[i]!.y - scannerCoordinates[j]!.y) + abs(scannerCoordinates[i]!.z - scannerCoordinates[j]!.z)
        if highestManhattanDistance < manhattan
        {
          highestManhattanDistance = manhattan
          print(i,j)
        }
      }
    }

    return "\(highestManhattanDistance)"
  }

  override func cleanUp()
  {
  }
}

