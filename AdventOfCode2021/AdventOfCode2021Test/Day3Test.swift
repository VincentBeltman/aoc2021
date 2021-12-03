//
//  Day3Test.swift
//  AdventOfCode2021
//
//  Created by Inspiro developer on 03/12/2021.
//

import Foundation

import XCTest
@testable import AdventOfCode2021

class Day3Test: XCTestCase
{
  override func setUpWithError() throws
  {
  }

  override func tearDownWithError() throws
  {
  }

  func testPart1Run() throws
  {
    let partRunner: Day3Part1 = Day3Part1(verbose: false)
    measure
    {
      let result: String = partRunner.doStuff(with: Day3Input.EXAMPLE)
      XCTAssert(result == "198")
    }
  }

  func testPart1CalculateRates2Items()
  {
    let partRunner: Day3Part1 = Day3Part1(verbose: false)
    let tuple: (Int, Int) = partRunner.calculateRates(nrOfOnesPerPosition: [3,4], nrOfLines: 9)
    let gammaRate: Int = tuple.0
    let epsilonRate: Int = tuple.1
    print(gammaRate)
    print(epsilonRate)
    XCTAssert(gammaRate == 0)
    XCTAssert(epsilonRate == 3)
  }
  func testPart1CalculateRates4Items()
  {
    let partRunner: Day3Part1 = Day3Part1(verbose: false)
    let tuple: (Int, Int) = partRunner.calculateRates(nrOfOnesPerPosition: [3,4,5,6], nrOfLines: 9)
    let gammaRate: Int = tuple.0
    let epsilonRate: Int = tuple.1
    print(gammaRate)
    print(epsilonRate)
    XCTAssert(gammaRate == 3)
    XCTAssert(epsilonRate == 12)
  }

  func testPart2Run() throws
  {
    let partRunner: Day3Part2 = Day3Part2(verbose: false)
    measure
    {
      let result: String = partRunner.doStuff(with: Day3Input.EXAMPLE)
      XCTAssert(result == "230")
    }
  }

  func testPart2GetNrOfOnes()
  {
    let partRunner: Day3Part2 = Day3Part2(verbose: false)
    var testInput: String = """
10000
00000
10000
"""
    XCTAssert(partRunner.getNrOfOnes(from: testInput.split(separator: "\n"), at: 0) == 2)

    testInput = """
01000
10000
00100
10000
10010
10000
00001
"""
    XCTAssert(partRunner.getNrOfOnes(from: testInput.split(separator: "\n"), at: 0) == 4)

    testInput = """
100000
010000
000010
010100
001000
010001
101110
"""
    XCTAssert(partRunner.getNrOfOnes(from: testInput.split(separator: "\n"), at: 1) == 3)
  }

  func testPart2RemoveAll()
  {
    let partRunner: Day3Part2 = Day3Part2(verbose: false)
    var testInput: [String.SubSequence] = """
10000
00000
10000
""".split(separator: "\n")
    partRunner.removeAll(from: &testInput, withChar: "1", at: 0)
    XCTAssert(testInput.count == 1)
    XCTAssert(testInput[0] == "00000")

    testInput = """
10000
00000
10100
""".split(separator: "\n")
    partRunner.removeAll(from: &testInput, withChar: "0", at: 0)
    XCTAssert(testInput.count == 2)
    XCTAssert(testInput[0] == "10000")
    XCTAssert(testInput[1] == "10100")

    testInput = """
10010
01000
10001
""".split(separator: "\n")
    partRunner.removeAll(from: &testInput, withChar: "1", at: 2)
    XCTAssert(testInput.count == 3)

    testInput = """
11110
01001
10001
01001
10001
01001
10001
01001
10001
""".split(separator: "\n")
    partRunner.removeAll(from: &testInput, withChar: "1", at: 4)
    XCTAssert(testInput.count == 1)
    XCTAssert(testInput[0] == "11110")
  }

  func testPart2BinaryToInt()
  {
    let partRunner: Day3Part2 = Day3Part2(verbose: false)
    XCTAssert(partRunner.binaryToInt(binaryString: "11") == 3)
    XCTAssert(partRunner.binaryToInt(binaryString: "1101") == 13)
    XCTAssert(partRunner.binaryToInt(binaryString: "001") == 1)
    XCTAssert(partRunner.binaryToInt(binaryString: "101") == 5)
    XCTAssert(partRunner.binaryToInt(binaryString: "10111") == 23)
  }
}
