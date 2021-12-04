//
//  Day4Test.swift
//  AdventOfCode2021
//
//  Created by Inspiro developer on 03/12/2021.
//

import Foundation

import XCTest
@testable import AdventOfCode2021

class Day4Test: XCTestCase
{
  override func setUpWithError() throws
  {
  }

  override func tearDownWithError() throws
  {
  }

  func testPart1Run() throws
  {
    let partRunner: Day4Part1 = Day4Part1(verbose: false)
    measure
    {
      let result: String = partRunner.doStuff(with: Day4Input.EXAMPLE)
      XCTAssert(result == "4512")
    }
  }

  func testPart2Run() throws
  {
    let partRunner: Day4Part2 = Day4Part2(verbose: false)
    measure
    {
      let result: String = partRunner.doStuff(with: Day4Input.EXAMPLE)
      XCTAssert(result == "1924")
    }
  }

  func testBingoCardHorizontalBingo() throws
  {
    let bingoCard: BingoCard = BingoCard(raw: """
 1  2  3  4  5
 6  7  8  9 10
11 12 13 14 15
16 17 18 19 20
21 22 23 24 25
""")

    XCTAssert(true  == bingoCard.handleNumberCalled(1))
    XCTAssert(false == bingoCard.hasBingo())

    XCTAssert(true  == bingoCard.handleNumberCalled(1))
    XCTAssert(false == bingoCard.hasBingo())

    XCTAssert(true  == bingoCard.handleNumberCalled(2))
    XCTAssert(false == bingoCard.hasBingo())

    XCTAssert(true  == bingoCard.handleNumberCalled(3))
    XCTAssert(false == bingoCard.hasBingo())

    XCTAssert(true  == bingoCard.handleNumberCalled(4))
    XCTAssert(false == bingoCard.hasBingo())

    XCTAssert(true  == bingoCard.handleNumberCalled(10))
    XCTAssert(false == bingoCard.hasBingo())

    XCTAssert(true  == bingoCard.handleNumberCalled(15))
    XCTAssert(false == bingoCard.hasBingo())

    XCTAssert(true  == bingoCard.handleNumberCalled(20))
    XCTAssert(false == bingoCard.hasBingo())

    XCTAssert(true  == bingoCard.handleNumberCalled(5))
    XCTAssert(true  == bingoCard.hasBingo())

    XCTAssert(265   == bingoCard.sumOfAllUnmarkedNumbers())
  }

  func testBingoCardVerticalBingo() throws
  {
    let bingoCard: BingoCard = BingoCard(raw: """
 1  2  3  4  5
 6  7  8  9 10
11 12 13 14 15
16 17 18 19 20
21 22 23 24 25
""")

    XCTAssert(true  == bingoCard.handleNumberCalled(5))
    XCTAssert(false == bingoCard.hasBingo())

    XCTAssert(true  == bingoCard.handleNumberCalled(10))
    XCTAssert(false == bingoCard.hasBingo())

    XCTAssert(true  == bingoCard.handleNumberCalled(15))
    XCTAssert(false == bingoCard.hasBingo())

    XCTAssert(true  == bingoCard.handleNumberCalled(20))
    XCTAssert(false == bingoCard.hasBingo())

    XCTAssert(true  == bingoCard.handleNumberCalled(25))
    XCTAssert(true  == bingoCard.hasBingo())

    print(bingoCard.sumOfAllUnmarkedNumbers())
    XCTAssert(250   == bingoCard.sumOfAllUnmarkedNumbers())

    XCTAssert(true  == bingoCard.handleNumberCalled(1))
    XCTAssert(true  == bingoCard.hasBingo())

    XCTAssert(249   == bingoCard.sumOfAllUnmarkedNumbers())
  }
}
