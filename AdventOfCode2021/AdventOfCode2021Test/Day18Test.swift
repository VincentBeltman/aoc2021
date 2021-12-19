//
//  Day18Test.swift
//  AdventOfCode2021Test
//
//  Created by Inspiro developer on 19/12/2021.
//

import XCTest
@testable import AdventOfCode2021

class Day18Test: XCTestCase
{
  override func setUpWithError() throws
  {
  }

  override func tearDownWithError() throws
  {
  }

  func testDay18SnailMathExample1()
  {
    let snailMath: SnailMath = SnailMath()
    XCTAssert(snailMath.sum == "")

    snailMath.add(raw: "[1,1]")
    XCTAssert(snailMath.sum == "[1,1]")

    snailMath.add(raw: "[2,2]")
    XCTAssert(snailMath.sum == "[[1,1],[2,2]]")

    snailMath.add(raw: "[3,3]")
    XCTAssert(snailMath.sum == "[[[1,1],[2,2]],[3,3]]")

    snailMath.add(raw: "[4,4]")
    XCTAssert(snailMath.sum == "[[[[1,1],[2,2]],[3,3]],[4,4]]")
  }

  func testDay18SnailMathExample2()
  {
    let snailMath: SnailMath = SnailMath()
    XCTAssert(snailMath.sum == "")

    snailMath.add(raw: "[1,1]")
    XCTAssert(snailMath.sum == "[1,1]")

    snailMath.add(raw: "[2,2]")
    XCTAssert(snailMath.sum == "[[1,1],[2,2]]")

    snailMath.add(raw: "[3,3]")
    XCTAssert(snailMath.sum == "[[[1,1],[2,2]],[3,3]]")

    snailMath.add(raw: "[4,4]")
    XCTAssert(snailMath.sum == "[[[[1,1],[2,2]],[3,3]],[4,4]]")

    snailMath.add(raw: "[5,5]")
    XCTAssert(snailMath.sum == "[[[[3,0],[5,3]],[4,4]],[5,5]]")
  }

  func testDay18SnailMathExample3()
  {
    let snailMath: SnailMath = SnailMath()
    XCTAssert(snailMath.sum == "")

    snailMath.add(raw: "[1,1]")
    XCTAssert(snailMath.sum == "[1,1]")

    snailMath.add(raw: "[2,2]")
    XCTAssert(snailMath.sum == "[[1,1],[2,2]]")

    snailMath.add(raw: "[3,3]")
    XCTAssert(snailMath.sum == "[[[1,1],[2,2]],[3,3]]")

    snailMath.add(raw: "[4,4]")
    XCTAssert(snailMath.sum == "[[[[1,1],[2,2]],[3,3]],[4,4]]")

    snailMath.add(raw: "[5,5]")
    XCTAssert(snailMath.sum == "[[[[3,0],[5,3]],[4,4]],[5,5]]")

    snailMath.add(raw: "[6,6]")
    XCTAssert(snailMath.sum == "[[[[5,0],[7,4]],[5,5]],[6,6]]")
  }

  func testDay18SnailMathExample4()
  {
    let snailMath: SnailMath = SnailMath()
    XCTAssert(snailMath.sum == "")

    snailMath.add(raw: "[1,1]")
    XCTAssert(snailMath.sum == "[1,1]")

    snailMath.add(raw: "[2,2]")
    XCTAssert(snailMath.sum == "[[1,1],[2,2]]")

    snailMath.add(raw: "[3,3]")
    XCTAssert(snailMath.sum == "[[[1,1],[2,2]],[3,3]]")

    snailMath.add(raw: "[4,4]")
    XCTAssert(snailMath.sum == "[[[[1,1],[2,2]],[3,3]],[4,4]]")

    snailMath.add(raw: "[5,5]")
    XCTAssert(snailMath.sum == "[[[[3,0],[5,3]],[4,4]],[5,5]]")

    snailMath.add(raw: "[6,6]")
    XCTAssert(snailMath.sum == "[[[[5,0],[7,4]],[5,5]],[6,6]]")

    snailMath.add(raw: "[7,7]")
    XCTAssert(snailMath.sum == "[[[[7,0],[9,5]],[6,6]],[7,7]]")

    snailMath.add(raw: "[8,8]")
    print(snailMath.sum)
    XCTAssert(snailMath.sum == "[[[[9,5],[6,0]],[[6,7],7]],[8,8]]")
  }

  func testDay18Part1AdvanceExample()
  {
    let snailMath: SnailMath = SnailMath()
    XCTAssert(snailMath.sum == "")

    snailMath.add(raw: "[[[0,[4,5]],[0,0]],[[[4,5],[2,6]],[9,5]]]")
    XCTAssert(snailMath.sum == "[[[0,[4,5]],[0,0]],[[[4,5],[2,6]],[9,5]]]")

    snailMath.add(raw: "[7,[[[3,7],[4,3]],[[6,3],[8,8]]]]")
    XCTAssert(snailMath.sum == "[[[[4,0],[5,4]],[[7,7],[6,0]]],[[8,[7,7]],[[7,9],[5,0]]]]")

    snailMath.add(raw: "[[2,[[0,8],[3,4]]],[[[6,7],1],[7,[1,6]]]]")
    XCTAssert(snailMath.sum == "[[[[6,7],[6,7]],[[7,7],[0,7]]],[[[8,7],[7,7]],[[8,8],[8,0]]]]")

    snailMath.add(raw: "[[[[2,4],7],[6,[0,5]]],[[[6,8],[2,8]],[[2,1],[4,5]]]]")
    XCTAssert(snailMath.sum == "[[[[7,0],[7,7]],[[7,7],[7,8]]],[[[7,7],[8,8]],[[7,7],[8,7]]]]")

    snailMath.add(raw: "[7,[5,[[3,8],[1,4]]]]")
    XCTAssert(snailMath.sum == "[[[[7,7],[7,8]],[[9,5],[8,7]]],[[[6,8],[0,8]],[[9,9],[9,0]]]]")

    snailMath.add(raw: "[[2,[2,2]],[8,[8,1]]]")
    XCTAssert(snailMath.sum == "[[[[6,6],[6,6]],[[6,0],[6,7]]],[[[7,7],[8,9]],[8,[8,1]]]]")

    snailMath.add(raw: "[2,9]")
    XCTAssert(snailMath.sum == "[[[[6,6],[7,7]],[[0,7],[7,7]]],[[[5,5],[5,6]],9]]")

    snailMath.add(raw: "[1,[[[9,3],9],[[9,0],[0,7]]]]")
    XCTAssert(snailMath.sum == "[[[[7,8],[6,7]],[[6,8],[0,8]]],[[[7,7],[5,0]],[[5,5],[5,6]]]]")

    snailMath.add(raw: "[[[5,[7,4]],7],1]")
    XCTAssert(snailMath.sum == "[[[[7,7],[7,7]],[[8,7],[8,7]]],[[[7,0],[7,7]],9]]")

    snailMath.add(raw: "[[[[4,2],2],6],[8,7]]")
    XCTAssert(snailMath.sum == "[[[[8,7],[7,7]],[[8,6],[7,7]]],[[[0,7],[6,6]],[8,7]]]")
  }

  func testMagnitude()
  {
    let snailMath1: SnailMath = SnailMath()
    snailMath1.add(raw: "[[1,2],[[3,4],5]]")
    XCTAssert(snailMath1.magnitude == 143)

    let snailMath2: SnailMath = SnailMath()
    snailMath2.add(raw: "[[[[0,7],4],[[7,8],[6,0]]],[8,1]]")
    XCTAssert(snailMath2.magnitude == 1384)

    let snailMath3: SnailMath = SnailMath()
    snailMath3.add(raw: "[[[[1,1],[2,2]],[3,3]],[4,4]]")
    XCTAssert(snailMath3.magnitude == 445)

    let snailMath4: SnailMath = SnailMath()
    snailMath4.add(raw: "[[[[3,0],[5,3]],[4,4]],[5,5]]")
    XCTAssert(snailMath4.magnitude == 791)

    let snailMath5: SnailMath = SnailMath()
    snailMath5.add(raw: "[[[[5,0],[7,4]],[5,5]],[6,6]]")
    XCTAssert(snailMath5.magnitude == 1137)

    let snailMath6: SnailMath = SnailMath()
    snailMath6.add(raw: "[[[[8,7],[7,7]],[[8,6],[7,7]]],[[[0,7],[6,6]],[8,7]]]")
    XCTAssert(snailMath6.magnitude == 3488)
  }
}

