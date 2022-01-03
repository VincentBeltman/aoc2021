//
//  Day19Test.swift
//  AdventOfCode2021
//
//  Created by Inspiro developer on 22/12/2021.
//

import Foundation

import XCTest
@testable import AdventOfCode2021

class Day19Test: XCTestCase
{
  override func setUpWithError() throws
  {
  }

  override func tearDownWithError() throws
  {
  }

  func testEdge()
  {
    var edge = Day19Part1.Edge(a: Day19Part1.Coordinate(x: 0, y: 0, z: 0), b: Day19Part1.Coordinate(x: 4, y: 3, z: 2))
    XCTAssertEqual(edge.directDistance, 5.4, accuracy: 0.1)

    edge = Day19Part1.Edge(a: Day19Part1.Coordinate(x: 1, y: 0, z: 0), b: Day19Part1.Coordinate(x: 5, y: 3, z: 2))
    XCTAssertEqual(edge.directDistance, 5.4, accuracy: 0.1)

    edge = Day19Part1.Edge(a: Day19Part1.Coordinate(x: 0, y: 1, z: 0), b: Day19Part1.Coordinate(x: 4, y: 4, z: 2))
    XCTAssertEqual(edge.directDistance, 5.4, accuracy: 0.1)

    edge = Day19Part1.Edge(a: Day19Part1.Coordinate(x: 0, y: 0, z: 1), b: Day19Part1.Coordinate(x: 4, y: 3, z: 3))
    XCTAssertEqual(edge.directDistance, 5.4, accuracy: 0.1)

    edge = Day19Part1.Edge(a: Day19Part1.Coordinate(x: 0, y: 1, z: 2), b: Day19Part1.Coordinate(x: 4, y: 4, z: 4))
    XCTAssertEqual(edge.directDistance, 5.4, accuracy: 0.1)

    edge = Day19Part1.Edge(a: Day19Part1.Coordinate(x: -1, y: 0, z: 0), b: Day19Part1.Coordinate(x: 3, y: 3, z: 2))
    XCTAssertEqual(edge.directDistance, 5.4, accuracy: 0.1)

    edge = Day19Part1.Edge(a: Day19Part1.Coordinate(x: 0, y: -1, z: 0), b: Day19Part1.Coordinate(x: 4, y: 2, z: 2))
    XCTAssertEqual(edge.directDistance, 5.4, accuracy: 0.1)

    edge = Day19Part1.Edge(a: Day19Part1.Coordinate(x: 0, y: 0, z: -1), b: Day19Part1.Coordinate(x: 4, y: 3, z: 1))
    XCTAssertEqual(edge.directDistance, 5.4, accuracy: 0.1)

    edge = Day19Part1.Edge(a: Day19Part1.Coordinate(x: -4, y: -3, z: -2), b: Day19Part1.Coordinate(x: 0, y: 0, z: 0))
    XCTAssertEqual(edge.directDistance, 5.4, accuracy: 0.1)

    edge = Day19Part1.Edge(a: Day19Part1.Coordinate(x: -10, y: -10, z: -10), b: Day19Part1.Coordinate(x: -6, y: -7, z: -8))
    XCTAssertEqual(edge.directDistance, 5.4, accuracy: 0.1)
  }
}
