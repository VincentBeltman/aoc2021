//
//  Day22Test.swift
//  AdventOfCode2021Test
//
//  Created by Inspiro developer on 04/01/2022.
//

import Foundation
import XCTest

class Day22Test: XCTestCase
{
  override func setUpWithError() throws
  {
  }

  override func tearDownWithError() throws
  {
  }

  func testExample1Part1()
  {
    let partRunner: Day22Part1 = Day22Part1(verbose: true)
    XCTAssert("39" == partRunner.doStuff(with: Day22Input.EXAMPLE_1))
  }

  func testExample2Part1()
  {
    let partRunner: Day22Part1 = Day22Part1(verbose: true)
    XCTAssert("590784" == partRunner.doStuff(with: Day22Input.EXAMPLE_2))
  }

  func testExample1Part2()
  {
    let partRunner: Day22Part2 = Day22Part2(verbose: true)
    XCTAssert("39" == partRunner.doStuff(with: Day22Input.EXAMPLE_1))
  }

  func testExample3Part2()
  {
    let partRunner: Day22Part2 = Day22Part2(verbose: true)
    XCTAssert("2758514936282235" == partRunner.doStuff(with: Day22Input.EXAMPLE_3))
  }
}

