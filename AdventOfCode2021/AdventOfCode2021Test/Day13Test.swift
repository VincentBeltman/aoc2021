//
//  Day13Test.swift
//  AdventOfCode2021
//
//  Created by Inspiro developer on 13/12/2021.
//

import XCTest
@testable import AdventOfCode2021

class Day13Test: XCTestCase
{
  override func setUpWithError() throws
  {
  }

  override func tearDownWithError() throws
  {
  }

  func testParseFold()
  {
    let partRunner: Day13Part1 = Day13Part1(verbose: false)

    let test1: (String, Int) = partRunner.parseFold("fold along x=5")
    XCTAssert(test1.0 == "x")
    XCTAssert(test1.1 == 5)

    let test2: (String, Int) = partRunner.parseFold("fold along y=3")
    XCTAssert(test2.0 == "y")
    XCTAssert(test2.1 == 3)

    let test3: (String, Int) = partRunner.parseFold("fold along x=1231")
    XCTAssert(test3.0 == "x")
    XCTAssert(test3.1 == 1231)

    let test4: (String, Int) = partRunner.parseFold("fold along y=8213")
    XCTAssert(test4.0 == "y")
    XCTAssert(test4.1 == 8213)
  }
}
