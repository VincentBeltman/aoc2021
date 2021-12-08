//
//  Day8Test.swift
//  AdventOfCode2021Test
//
//  Created by Inspiro developer on 08/12/2021.
//

import Foundation

import XCTest
@testable import AdventOfCode2021

class Day8Test: XCTestCase
{
  override func setUpWithError() throws
  {
  }

  override func tearDownWithError() throws
  {
  }

  func testKeepDoubleOnly()
  {
    XCTAssert("" == Day8Part2.Parser.keepDoubleOnly(a: "a", b: "b"))
    XCTAssert("a" == Day8Part2.Parser.keepDoubleOnly(a: "a", b: "ab"))
    XCTAssert("" == Day8Part2.Parser.keepDoubleOnly(a: "a", b: ""))
    XCTAssert("" == Day8Part2.Parser.keepDoubleOnly(a: "", b: "b"))
    XCTAssert("b" == Day8Part2.Parser.keepDoubleOnly(a: "abc", b: "bd"))
    XCTAssert("abc" == Day8Part2.Parser.keepDoubleOnly(a: "abc", b: "abc"))
  }

  func testKeepUniqueOnly()
  {
    XCTAssert("a" == Day8Part2.Parser.keepUniqueOnly(a: "a", b: "b"))
    XCTAssert("" == Day8Part2.Parser.keepUniqueOnly(a: "a", b: "ab"))
    XCTAssert("a" == Day8Part2.Parser.keepUniqueOnly(a: "a", b: ""))
    XCTAssert("" == Day8Part2.Parser.keepUniqueOnly(a: "", b: "b"))
    XCTAssert("ac" == Day8Part2.Parser.keepUniqueOnly(a: "abc", b: "bd"))
    XCTAssert("" == Day8Part2.Parser.keepUniqueOnly(a: "abc", b: "abc"))
  }

  func testParser()
  {
    let parser: Day8Part2.Parser = Day8Part2.Parser(input: "be cfbegad cbdgef fgaecd cgeb fdcge agebfd fecdb fabcd edb")
    XCTAssert(1 == parser.parseNumber(signal: "be"))
    XCTAssert(1 == parser.parseNumber(signal: "eb"))
    XCTAssert(2 == parser.parseNumber(signal: "abcdf"))
    XCTAssert(3 == parser.parseNumber(signal: "bcdef"))
    XCTAssert(4 == parser.parseNumber(signal: "bceg"))
    XCTAssert(5 == parser.parseNumber(signal: "cdefg"))
    XCTAssert(6 == parser.parseNumber(signal: "acdefg"))
    XCTAssert(7 == parser.parseNumber(signal: "bde"))
    XCTAssert(8 == parser.parseNumber(signal: "abcdefg"))
    XCTAssert(9 == parser.parseNumber(signal: "bcdefg"))
    XCTAssert(0 == parser.parseNumber(signal: "abdefg"))
  }
}
