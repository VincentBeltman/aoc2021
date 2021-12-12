//
//  GraphTest.swift
//  AdventOfCode2021Test
//
//  Created by Inspiro developer on 12/12/2021.
//

import XCTest
@testable import AdventOfCode2021

class GraphTest: XCTestCase
{
  override func setUpWithError() throws
  {
  }

  override func tearDownWithError() throws
  {
  }

  func shouldGoToVertex(_: [Int], _: Int) -> Bool
  {
    return false
  }

  func testGraphAddEdge()
  {
    let graph: Graph<Int> = Graph<Int>(delegate: shouldGoToVertex)

    graph.addEdgeBetween(x: 0, y: 1)
    var edges: [Int] = graph.getEdges(from: 0)
    XCTAssert(edges[0] == 1)
    XCTAssert(edges.count == 1)
    edges = graph.getEdges(from: 1)
    XCTAssert(edges[0] == 0)
    XCTAssert(edges.count == 1)

    graph.addEdgeBetween(x: 0, y: 1)
    edges = graph.getEdges(from: 0)
    XCTAssert(edges[0] == 1)
    XCTAssert(edges.count == 1)
    edges = graph.getEdges(from: 1)
    XCTAssert(edges[0] == 0)
    XCTAssert(edges.count == 1)

    graph.addEdgeBetween(x: 0, y: 2)
    edges = graph.getEdges(from: 0)
    XCTAssert(edges.contains(1))
    XCTAssert(edges.contains(2))
    XCTAssert(edges.count == 2)
    edges = graph.getEdges(from: 1)
    XCTAssert(edges.contains(0))
    XCTAssert(edges.count == 1)
    edges = graph.getEdges(from: 2)
    XCTAssert(edges.contains(0))
    XCTAssert(edges.count == 1)

    graph.addEdgeBetween(x: 1, y: 2)
    edges = graph.getEdges(from: 0)
    XCTAssert(edges.contains(1))
    XCTAssert(edges.contains(2))
    XCTAssert(edges.count == 2)
    edges = graph.getEdges(from: 1)
    XCTAssert(edges.contains(0))
    XCTAssert(edges.contains(2))
    XCTAssert(edges.count == 2)
    edges = graph.getEdges(from: 2)
    XCTAssert(edges.contains(0))
    XCTAssert(edges.contains(1))
    XCTAssert(edges.count == 2)
  }

  func testDay12Part1()
  {
    let partRunner: Day12Part1 = Day12Part1(verbose: false)

    XCTAssert("10" == partRunner.doStuff(with: Day12Input.EXAMPLE_1))
    partRunner.cleanUp()

    XCTAssert("19" == partRunner.doStuff(with: Day12Input.EXAMPLE_2))
    partRunner.cleanUp()

    XCTAssert("226" == partRunner.doStuff(with: Day12Input.EXAMPLE_3))
    partRunner.cleanUp()
  }

  func testDay12Part2()
  {
    let partRunner: Day12Part2 = Day12Part2(verbose: false)

    XCTAssert("36" == partRunner.doStuff(with: Day12Input.EXAMPLE_1))
    partRunner.cleanUp()

    XCTAssert("103" == partRunner.doStuff(with: Day12Input.EXAMPLE_2))
    partRunner.cleanUp()

    XCTAssert("3509" == partRunner.doStuff(with: Day12Input.EXAMPLE_3))
    partRunner.cleanUp()
  }
}

