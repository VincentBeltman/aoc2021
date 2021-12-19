//
//  Day16Test.swift
//  AdventOfCode2021
//
//  Created by Inspiro developer on 18/12/2021.
//

import XCTest
@testable import AdventOfCode2021

class Day16Test: XCTestCase
{
  override func setUpWithError() throws
  {
  }

  override func tearDownWithError() throws
  {
  }

  func testBitParserGetInt()
  {
    let parser: BitsParser = BitsParser()
    XCTAssert(0  == parser.getInt(outOf: ["0", "0", "0", "0", "1", "1", "1", "1"], from: 0, withLength: 3))
    XCTAssert(0  == parser.getInt(outOf: ["0", "0", "0", "0", "1", "1", "1", "1"], from: 1, withLength: 3))
    XCTAssert(1  == parser.getInt(outOf: ["0", "0", "0", "0", "1", "1", "1", "1"], from: 2, withLength: 3))
    XCTAssert(3  == parser.getInt(outOf: ["0", "0", "0", "0", "1", "1", "1", "1"], from: 3, withLength: 3))
    XCTAssert(7  == parser.getInt(outOf: ["0", "0", "0", "0", "1", "1", "1", "1"], from: 4, withLength: 3))
    XCTAssert(15 == parser.getInt(outOf: ["0", "0", "0", "0", "1", "1", "1", "1"], from: 4, withLength: 4))
  }

  func testParseLiteralValue()
  {
    let parser: BitsParser = BitsParser()
    let results: BitsParser.Results = parser.parse(raw: Day16Input.EXAMPLE_1)
    XCTAssert(results.versionTotal == 6)
    XCTAssert(results.usedLength == 21)
    XCTAssert(results.totalValue == 2021)
  }

  func testParseSimpleOperatorLengthType0()
  {
    let parser: BitsParser = BitsParser()
    let results: BitsParser.Results = parser.parse(raw: Day16Input.EXAMPLE_2)
    XCTAssert(results.versionTotal == 9)
    XCTAssert(results.usedLength == 49)
  }

  func testParseSimpleOperatorLengthType1()
  {
    let parser: BitsParser = BitsParser()
    let results: BitsParser.Results = parser.parse(raw: Day16Input.EXAMPLE_3)
    XCTAssert(results.versionTotal == 14)
    XCTAssert(results.usedLength == 51)
  }

  func testParseOtherExamples()
  {
    let parser: BitsParser = BitsParser()
    var results: BitsParser.Results = parser.parse(raw: Day16Input.EXAMPLE_4)
    XCTAssert(results.versionTotal == 16)

    results = parser.parse(raw: Day16Input.EXAMPLE_5)
    XCTAssert(results.versionTotal == 12)

    results = parser.parse(raw: Day16Input.EXAMPLE_6)
    XCTAssert(results.versionTotal == 23)

    results = parser.parse(raw: Day16Input.EXAMPLE_7)
    XCTAssert(results.versionTotal == 31)
  }

  func testOperators()
  {
    let parser: BitsParser = BitsParser()
    // sum
    var results: BitsParser.Results = parser.parse(raw: "C200B40A82")
    XCTAssert(results.totalValue == 3)

    // product
    results = parser.parse(raw: "04005AC33890")
    XCTAssert(results.totalValue == 54)

    // minimum
    results = parser.parse(raw: "880086C3E88112")
    XCTAssert(results.totalValue == 7)

    // maximum
    results = parser.parse(raw: "CE00C43D881120")
    XCTAssert(results.totalValue == 9)

    // less
    results = parser.parse(raw: "D8005AC2A8F0")
    XCTAssert(results.totalValue == 1)

    // greater
    results = parser.parse(raw: "F600BC2D8F")
    XCTAssert(results.totalValue == 0)

    // equal
    results = parser.parse(raw: "9C005AC2F8F0")
    XCTAssert(results.totalValue == 0)

    // advanced
    results = parser.parse(raw: "9C0141080250320F1802104A08")
    XCTAssert(results.totalValue == 1)
  }
}

