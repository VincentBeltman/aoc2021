//
//  Day10Test.swift
//  AdventOfCode2021Test
//
//  Created by Inspiro developer on 10/12/2021.
//

import XCTest
@testable import AdventOfCode2021

class Day10Test: XCTestCase
{
  override func setUpWithError() throws
  {
  }

  override func tearDownWithError() throws
  {
  }

  func testCheckForCorruption()
  {
    XCTAssert(nil == Day10Part1.checkForCorruption(in: "[({(<(())[]>[[{[]{<()<>>"))
    XCTAssert(nil == Day10Part1.checkForCorruption(in: "[(()[<>])]({[<{<<[]>>("))
    XCTAssert("}" == Day10Part1.checkForCorruption(in: "{([(<{}[<>[]}>{[]{[(<()>"))
    XCTAssert(nil == Day10Part1.checkForCorruption(in: "(((({<>}<{<{<>}{[]{[]{}"))
    XCTAssert(")" == Day10Part1.checkForCorruption(in: "[[<[([]))<([[{}[[()]]]"))
    XCTAssert("]" == Day10Part1.checkForCorruption(in: "[{[{({}]{}}([{[{{{}}([]"))
    XCTAssert(nil == Day10Part1.checkForCorruption(in: "{<[[]]>}<{[{[{[]{()[[[]"))
    XCTAssert(")" == Day10Part1.checkForCorruption(in: "[<(<(<(<{}))><([]([]()"))
    XCTAssert(">" == Day10Part1.checkForCorruption(in: "<{([([[(<>()){}]>(<<{{"))
    XCTAssert(nil == Day10Part1.checkForCorruption(in: "<{([{{}}[<[[[<>{}]]]>[]]"))
  }

  func testDay10Part1()
  {
    let partRunner: Day10Part1 = Day10Part1(verbose: false)
    XCTAssert("26397" == partRunner.doStuff(with: Day10Input.EXAMPLE))
  }
}
