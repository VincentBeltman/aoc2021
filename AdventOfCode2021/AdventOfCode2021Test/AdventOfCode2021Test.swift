//
//  AdventOfCode2021Test.swift
//  AdventOfCode2021Test
//
//  Created by Inspiro developer on 02/12/2021.
//

import XCTest
@testable import AdventOfCode2021

class AdventOfCode2021Test: XCTestCase
{
  override func setUpWithError() throws
  {
  }

  override func tearDownWithError() throws
  {
  }

  func testDay1Part1() throws
  {
    let partRunner: Day1Part1 = Day1Part1(verbose: false)
    measure
    {
      let result: String = partRunner.doStuff(with: Day1Input.EXAMPLE)
      XCTAssert(result == "7")
    }
  }

  func testDay1Part2() throws
  {
    let partRunner: Day1Part2 = Day1Part2(verbose: false)
    measure
    {
      let result: String = partRunner.doStuff(with: Day1Input.EXAMPLE)
      XCTAssert(result == "5")
    }
  }

  func testDay2Part1() throws
  {
    let partRunner: Day2Part1 = Day2Part1(verbose: false)
    measure
    {
      let result: String = partRunner.doStuff(with: Day2Input.EXAMPLE)
      XCTAssert(result == "150")
    }
  }

  func testDay2Part2() throws
  {
    let partRunner: Day2Part2 = Day2Part2(verbose: false)
    measure
    {
      let result: String = partRunner.doStuff(with: Day2Input.EXAMPLE)
      XCTAssert(result == "900")
    }
  }
}
