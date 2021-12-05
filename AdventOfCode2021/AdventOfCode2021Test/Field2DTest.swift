//
//  Field2DTest.swift
//  AdventOfCode2021
//
//  Created by Inspiro developer on 05/12/2021.
//

import XCTest
@testable import AdventOfCode2021

class Field2DTest: XCTestCase
{
  override func setUpWithError() throws
  {
  }

  override func tearDownWithError() throws
  {
  }

  func testDefaultValue() throws
  {
    let intField0: IntField2D = IntField2D(defaultValue: 0)

    XCTAssert(0 == intField0.getValue(at: IntField2D.Coordinate(y: 0, x: 0)))
    XCTAssert(0 == intField0.getValue(at: IntField2D.Coordinate(y: 1, x: 1)))

    let intField246: IntField2D = IntField2D(defaultValue: 246)

    XCTAssert(246 == intField246.getValue(at: IntField2D.Coordinate(y: 0, x: 0)))
    XCTAssert(246 == intField246.getValue(at: IntField2D.Coordinate(y: 1, x: 1)))

    let stringFieldDot: StringField2D = StringField2D(defaultValue: ".")

    XCTAssert("." == stringFieldDot.getValue(at: StringField2D.Coordinate(y: 0, x: 0)))
    XCTAssert("." == stringFieldDot.getValue(at: StringField2D.Coordinate(y: 1, x: 1)))
  }

  func testSetValue() throws
  {
    let intField: IntField2D = IntField2D(defaultValue: 0)
    XCTAssert(0 == intField.getValue(at: IntField2D.Coordinate(y: 0, x: 0)))
    XCTAssert(0 == intField.getValue(at: IntField2D.Coordinate(y: 1, x: 1)))

    intField.setValue(1, at: IntField2D.Coordinate(y: 0, x: 0))
    XCTAssert(1 == intField.getValue(at: IntField2D.Coordinate(y: 0, x: 0)))
    XCTAssert(0 == intField.getValue(at: IntField2D.Coordinate(y: 1, x: 1)))

    intField.setValue(1, at: IntField2D.Coordinate(y: 0, x: 0))
    XCTAssert(1 == intField.getValue(at: IntField2D.Coordinate(y: 0, x: 0)))
    XCTAssert(0 == intField.getValue(at: IntField2D.Coordinate(y: 1, x: 1)))

    intField.setValue(2, at: IntField2D.Coordinate(y: 0, x: 0))
    XCTAssert(2 == intField.getValue(at: IntField2D.Coordinate(y: 0, x: 0)))
    XCTAssert(0 == intField.getValue(at: IntField2D.Coordinate(y: 1, x: 1)))

    intField.setValue(1, at: IntField2D.Coordinate(y: 1, x: 1))
    XCTAssert(2 == intField.getValue(at: IntField2D.Coordinate(y: 0, x: 0)))
    XCTAssert(1 == intField.getValue(at: IntField2D.Coordinate(y: 1, x: 1)))

    let stringField: StringField2D = StringField2D(defaultValue: ".")
    XCTAssert("." == stringField.getValue(at: StringField2D.Coordinate(y: 0, x: 0)))
    XCTAssert("." == stringField.getValue(at: StringField2D.Coordinate(y: 1, x: 1)))

    stringField.setValue("#", at: StringField2D.Coordinate(y: 0, x: 0))
    XCTAssert("#" == stringField.getValue(at: StringField2D.Coordinate(y: 0, x: 0)))
    XCTAssert("." == stringField.getValue(at: StringField2D.Coordinate(y: 1, x: 1)))

    stringField.setValue("#", at: StringField2D.Coordinate(y: 0, x: 0))
    XCTAssert("#" == stringField.getValue(at: StringField2D.Coordinate(y: 0, x: 0)))
    XCTAssert("." == stringField.getValue(at: StringField2D.Coordinate(y: 1, x: 1)))

    stringField.setValue("?", at: StringField2D.Coordinate(y: 0, x: 0))
    XCTAssert("?" == stringField.getValue(at: StringField2D.Coordinate(y: 0, x: 0)))
    XCTAssert("." == stringField.getValue(at: StringField2D.Coordinate(y: 1, x: 1)))

    stringField.setValue("#", at: StringField2D.Coordinate(y: 1, x: 1))
    XCTAssert("?" == stringField.getValue(at: StringField2D.Coordinate(y: 0, x: 0)))
    XCTAssert("#" == stringField.getValue(at: StringField2D.Coordinate(y: 1, x: 1)))
  }

  func testAddValue() throws
  {
    let intField: IntField2D = IntField2D(defaultValue: 0)
    XCTAssert(0 == intField.getValue(at: IntField2D.Coordinate(y: 0, x: 0)))
    XCTAssert(0 == intField.getValue(at: IntField2D.Coordinate(y: 1, x: 1)))

    intField.addValue(1, at: IntField2D.Coordinate(y: 0, x: 0))
    XCTAssert(1 == intField.getValue(at: IntField2D.Coordinate(y: 0, x: 0)))
    XCTAssert(0 == intField.getValue(at: IntField2D.Coordinate(y: 1, x: 1)))

    intField.addValue(1, at: IntField2D.Coordinate(y: 0, x: 0))
    XCTAssert(2 == intField.getValue(at: IntField2D.Coordinate(y: 0, x: 0)))
    XCTAssert(0 == intField.getValue(at: IntField2D.Coordinate(y: 1, x: 1)))

    intField.addValue(2, at: IntField2D.Coordinate(y: 0, x: 0))
    XCTAssert(4 == intField.getValue(at: IntField2D.Coordinate(y: 0, x: 0)))
    XCTAssert(0 == intField.getValue(at: IntField2D.Coordinate(y: 1, x: 1)))

    intField.addValue(1, at: IntField2D.Coordinate(y: 1, x: 1))
    XCTAssert(4 == intField.getValue(at: IntField2D.Coordinate(y: 0, x: 0)))
    XCTAssert(1 == intField.getValue(at: IntField2D.Coordinate(y: 1, x: 1)))
  }

  func testResize()
  {
    let intField: IntField2D = IntField2D(defaultValue: 0)
    XCTAssert(intField.getWidth() == 0)
    XCTAssert(intField.getHeight() == 0)

    intField.resize(to: IntField2D.Coordinate(y: 1, x: 1))
    XCTAssert(intField.getWidth() == 2)
    XCTAssert(intField.getHeight() == 2)

    intField.resize(to: IntField2D.Coordinate(y: 10, x: 10))
    XCTAssert(intField.getWidth() == 11)
    XCTAssert(intField.getHeight() == 11)

    intField.resize(to: IntField2D.Coordinate(y: 100, x: 10))
    XCTAssert(intField.getWidth() == 11)
    XCTAssert(intField.getHeight() == 101)

    intField.resize(to: IntField2D.Coordinate(y: 100, x: 100))
    XCTAssert(intField.getWidth() == 101)
    XCTAssert(intField.getHeight() == 101)

    intField.resize(to: IntField2D.Coordinate(y: 50, x: 100))
    XCTAssert(intField.getWidth() == 101)
    XCTAssert(intField.getHeight() == 101)

    intField.resize(to: IntField2D.Coordinate(y: 100, x: 50))
    XCTAssert(intField.getWidth() == 101)
    XCTAssert(intField.getHeight() == 101)
  }

  func testCountNrOfOccurences()
  {
    let intField: IntField2D = IntField2D(defaultValue: 0)
    XCTAssert(0 == intField.countNrOfOccurrences(biggerThanOrEqualTo: 0))

    intField.addValue(1, at: IntField2D.Coordinate(y: 0, x: 0))
    XCTAssert(1 == intField.countNrOfOccurrences(biggerThanOrEqualTo: 0))
    XCTAssert(1 == intField.countNrOfOccurrences(biggerThanOrEqualTo: 1))

    intField.addValue(1, at: IntField2D.Coordinate(y: 1, x: 1))
    XCTAssert(4 == intField.countNrOfOccurrences(biggerThanOrEqualTo: 0))
    XCTAssert(2 == intField.countNrOfOccurrences(biggerThanOrEqualTo: 1))

    intField.addValue(1, at: IntField2D.Coordinate(y: 1, x: 1))
    XCTAssert(4 == intField.countNrOfOccurrences(biggerThanOrEqualTo: 0))
    XCTAssert(2 == intField.countNrOfOccurrences(biggerThanOrEqualTo: 1))
    XCTAssert(1 == intField.countNrOfOccurrences(biggerThanOrEqualTo: 2))
  }

  func testSetRange()
  {
    let intField: IntField2D = IntField2D(defaultValue: 0)
    intField.setRange(1, atRange: IntField2D.CoordinateRange(start: IntField2D.Coordinate(y: 1, x: 0), end: IntField2D.Coordinate(y: 1, x: 5)))
    XCTAssert(0 == intField.getValue(at: IntField2D.Coordinate(y: 0, x: 0)))
    XCTAssert(1 == intField.getValue(at: IntField2D.Coordinate(y: 1, x: 0)))
    XCTAssert(1 == intField.getValue(at: IntField2D.Coordinate(y: 1, x: 1)))
    XCTAssert(1 == intField.getValue(at: IntField2D.Coordinate(y: 1, x: 2)))
    XCTAssert(1 == intField.getValue(at: IntField2D.Coordinate(y: 1, x: 3)))
    XCTAssert(1 == intField.getValue(at: IntField2D.Coordinate(y: 1, x: 4)))
    XCTAssert(1 == intField.getValue(at: IntField2D.Coordinate(y: 1, x: 5)))
    intField.setRange(2, atRange: IntField2D.CoordinateRange(start: IntField2D.Coordinate(y: 1, x: 3), end: IntField2D.Coordinate(y: 1, x: 5)))
    XCTAssert(0 == intField.getValue(at: IntField2D.Coordinate(y: 0, x: 0)))
    XCTAssert(1 == intField.getValue(at: IntField2D.Coordinate(y: 1, x: 0)))
    XCTAssert(1 == intField.getValue(at: IntField2D.Coordinate(y: 1, x: 1)))
    XCTAssert(1 == intField.getValue(at: IntField2D.Coordinate(y: 1, x: 2)))
    XCTAssert(2 == intField.getValue(at: IntField2D.Coordinate(y: 1, x: 3)))
    XCTAssert(2 == intField.getValue(at: IntField2D.Coordinate(y: 1, x: 4)))
    XCTAssert(2 == intField.getValue(at: IntField2D.Coordinate(y: 1, x: 5)))
  }

  func testAddRange()
  {
    let intField: IntField2D = IntField2D(defaultValue: 0)
    intField.addRange(1, atRange: IntField2D.CoordinateRange(start: IntField2D.Coordinate(y: 1, x: 0), end: IntField2D.Coordinate(y: 1, x: 5)))
    XCTAssert(0 == intField.getValue(at: IntField2D.Coordinate(y: 0, x: 0)))
    XCTAssert(1 == intField.getValue(at: IntField2D.Coordinate(y: 1, x: 0)))
    XCTAssert(1 == intField.getValue(at: IntField2D.Coordinate(y: 1, x: 1)))
    XCTAssert(1 == intField.getValue(at: IntField2D.Coordinate(y: 1, x: 2)))
    XCTAssert(1 == intField.getValue(at: IntField2D.Coordinate(y: 1, x: 3)))
    XCTAssert(1 == intField.getValue(at: IntField2D.Coordinate(y: 1, x: 4)))
    XCTAssert(1 == intField.getValue(at: IntField2D.Coordinate(y: 1, x: 5)))
    intField.addRange(2, atRange: IntField2D.CoordinateRange(start: IntField2D.Coordinate(y: 1, x: 3), end: IntField2D.Coordinate(y: 1, x: 5)))
    XCTAssert(0 == intField.getValue(at: IntField2D.Coordinate(y: 0, x: 0)))
    XCTAssert(1 == intField.getValue(at: IntField2D.Coordinate(y: 1, x: 0)))
    XCTAssert(1 == intField.getValue(at: IntField2D.Coordinate(y: 1, x: 1)))
    XCTAssert(1 == intField.getValue(at: IntField2D.Coordinate(y: 1, x: 2)))
    XCTAssert(3 == intField.getValue(at: IntField2D.Coordinate(y: 1, x: 3)))
    XCTAssert(3 == intField.getValue(at: IntField2D.Coordinate(y: 1, x: 4)))
    XCTAssert(3 == intField.getValue(at: IntField2D.Coordinate(y: 1, x: 5)))
  }

  func testDay5Part1()
  {
    let partRunner: Day5Part1 = Day5Part1(verbose: true)
    XCTAssert("5" == partRunner.doStuff(with: Day5Input.EXAMPLE_PART_1))
  }

  func testDay5Part2()
  {
    let partRunner: Day5Part2 = Day5Part2(verbose: true)
    XCTAssert("12" == partRunner.doStuff(with: Day5Input.EXAMPLE_PART_2))
  }
}

