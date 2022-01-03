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

  func testIterator()
  {
    let intField: IntField2D = IntField2D(defaultValue: 0)
    intField.setRange(1, atRange: IntField2D.CoordinateRange(start: IntField2D.Coordinate(y: 0, x: 0), end: IntField2D.Coordinate(y: 0, x: 4)))
    intField.setRange(2, atRange: IntField2D.CoordinateRange(start: IntField2D.Coordinate(y: 1, x: 0), end: IntField2D.Coordinate(y: 1, x: 4)))
    intField.setRange(3, atRange: IntField2D.CoordinateRange(start: IntField2D.Coordinate(y: 2, x: 0), end: IntField2D.Coordinate(y: 2, x: 4)))
    intField.setRange(4, atRange: IntField2D.CoordinateRange(start: IntField2D.Coordinate(y: 3, x: 0), end: IntField2D.Coordinate(y: 3, x: 4)))
    intField.setRange(5, atRange: IntField2D.CoordinateRange(start: IntField2D.Coordinate(y: 4, x: 0), end: IntField2D.Coordinate(y: 4, x: 4)))

    var x = 0
    var y = 0
    for coordinate in intField
    {
      XCTAssert(coordinate.x == x)
      XCTAssert(coordinate.y == y)
      XCTAssert(intField.getValue(at: coordinate) == y+1)
      x += 1
      if x == 5
      {
        x = 0
        y += 1
      }
    }
  }

  func testNeighbours()
  {
    let intField: IntField2D = IntField2D(defaultValue: 0)
    intField.setValue(0, at: IntField2D.Coordinate(y: 0, x: 0))
    intField.setValue(1, at: IntField2D.Coordinate(y: 0, x: 1))
    intField.setValue(2, at: IntField2D.Coordinate(y: 0, x: 2))
    intField.setValue(3, at: IntField2D.Coordinate(y: 1, x: 0))
    intField.setValue(4, at: IntField2D.Coordinate(y: 1, x: 1))
    intField.setValue(5, at: IntField2D.Coordinate(y: 1, x: 2))
    intField.setValue(6, at: IntField2D.Coordinate(y: 2, x: 0))
    intField.setValue(7, at: IntField2D.Coordinate(y: 2, x: 1))
    intField.setValue(8, at: IntField2D.Coordinate(y: 2, x: 2))

    let neighboursof00: [Int] = intField.getNeighbours(of: IntField2D.Coordinate(y: 0, x: 0))
    XCTAssert(neighboursof00.contains(1))
    XCTAssert(neighboursof00.contains(3))
    XCTAssert(neighboursof00.count == 2)

    let neighboursof01: [Int] = intField.getNeighbours(of: IntField2D.Coordinate(y: 0, x: 1))
    XCTAssert(neighboursof01.contains(0))
    XCTAssert(neighboursof01.contains(2))
    XCTAssert(neighboursof01.contains(4))
    XCTAssert(neighboursof01.count == 3)

    let neighboursof02: [Int] = intField.getNeighbours(of: IntField2D.Coordinate(y: 0, x: 2))
    XCTAssert(neighboursof02.contains(1))
    XCTAssert(neighboursof02.contains(5))
    XCTAssert(neighboursof02.count == 2)

    let neighboursof10: [Int] = intField.getNeighbours(of: IntField2D.Coordinate(y: 1, x: 0))
    XCTAssert(neighboursof10.contains(0))
    XCTAssert(neighboursof10.contains(4))
    XCTAssert(neighboursof10.contains(6))
    XCTAssert(neighboursof10.count == 3)

    let neighboursof11: [Int] = intField.getNeighbours(of: IntField2D.Coordinate(y: 1, x: 1))
    XCTAssert(neighboursof11.contains(1))
    XCTAssert(neighboursof11.contains(3))
    XCTAssert(neighboursof11.contains(5))
    XCTAssert(neighboursof11.contains(7))
    XCTAssert(neighboursof11.count == 4)

    let neighboursof12: [Int] = intField.getNeighbours(of: IntField2D.Coordinate(y: 1, x: 2))
    XCTAssert(neighboursof12.contains(2))
    XCTAssert(neighboursof12.contains(4))
    XCTAssert(neighboursof12.contains(8))
    XCTAssert(neighboursof12.count == 3)

    let neighboursof20: [Int] = intField.getNeighbours(of: IntField2D.Coordinate(y: 2, x: 0))
    XCTAssert(neighboursof20.contains(3))
    XCTAssert(neighboursof20.contains(7))
    XCTAssert(neighboursof20.count == 2)

    let neighboursof21: [Int] = intField.getNeighbours(of: IntField2D.Coordinate(y: 2, x: 1))
    XCTAssert(neighboursof21.contains(6))
    XCTAssert(neighboursof21.contains(4))
    XCTAssert(neighboursof21.contains(8))
    XCTAssert(neighboursof21.count == 3)

    let neighboursof22: [Int] = intField.getNeighbours(of: IntField2D.Coordinate(y: 2, x: 2))
    XCTAssert(neighboursof22.contains(5))
    XCTAssert(neighboursof22.contains(7))
    XCTAssert(neighboursof22.count == 2)

    let neighboursof22b: [Int] = intField.getNeighbours(of: IntField2D.Coordinate(y: 2, x: 2), includingSelf: true)
    XCTAssert(neighboursof22b.contains(5))
    XCTAssert(neighboursof22b.contains(7))
    XCTAssert(neighboursof22b.contains(8))
    XCTAssert(neighboursof22b.count == 3)

    let neighboursof12b: [Int] = intField.getNeighbours(of: IntField2D.Coordinate(y: 1, x: 2), includingSelf: true)
    XCTAssert(neighboursof12b.contains(2))
    XCTAssert(neighboursof12b.contains(4))
    XCTAssert(neighboursof12b.contains(5))
    XCTAssert(neighboursof12b.contains(8))
    XCTAssert(neighboursof12b.count == 4)
  }

  func testNeighboursDiagonal()
  {
    let intField: IntField2D = IntField2D(defaultValue: 0, enableDiagonals: true)
    intField.setValue(0, at: IntField2D.Coordinate(y: 0, x: 0))
    intField.setValue(1, at: IntField2D.Coordinate(y: 0, x: 1))
    intField.setValue(2, at: IntField2D.Coordinate(y: 0, x: 2))
    intField.setValue(3, at: IntField2D.Coordinate(y: 1, x: 0))
    intField.setValue(4, at: IntField2D.Coordinate(y: 1, x: 1))
    intField.setValue(5, at: IntField2D.Coordinate(y: 1, x: 2))
    intField.setValue(6, at: IntField2D.Coordinate(y: 2, x: 0))
    intField.setValue(7, at: IntField2D.Coordinate(y: 2, x: 1))
    intField.setValue(8, at: IntField2D.Coordinate(y: 2, x: 2))

    let neighboursof00: [Int] = intField.getNeighbours(of: IntField2D.Coordinate(y: 0, x: 0))
    XCTAssert(neighboursof00.contains(1))
    XCTAssert(neighboursof00.contains(3))
    XCTAssert(neighboursof00.contains(4))
    XCTAssert(neighboursof00.count == 3)

    let neighboursof01: [Int] = intField.getNeighbours(of: IntField2D.Coordinate(y: 0, x: 1))
    XCTAssert(neighboursof01.contains(0))
    XCTAssert(neighboursof01.contains(2))
    XCTAssert(neighboursof01.contains(3))
    XCTAssert(neighboursof01.contains(4))
    XCTAssert(neighboursof01.contains(5))
    XCTAssert(neighboursof01.count == 5)

    let neighboursof02: [Int] = intField.getNeighbours(of: IntField2D.Coordinate(y: 0, x: 2))
    XCTAssert(neighboursof02.contains(1))
    XCTAssert(neighboursof02.contains(4))
    XCTAssert(neighboursof02.contains(5))
    XCTAssert(neighboursof02.count == 3)

    let neighboursof10: [Int] = intField.getNeighbours(of: IntField2D.Coordinate(y: 1, x: 0))
    XCTAssert(neighboursof10.contains(0))
    XCTAssert(neighboursof10.contains(1))
    XCTAssert(neighboursof10.contains(4))
    XCTAssert(neighboursof10.contains(6))
    XCTAssert(neighboursof10.contains(7))
    XCTAssert(neighboursof10.count == 5)

    let neighboursof11: [Int] = intField.getNeighbours(of: IntField2D.Coordinate(y: 1, x: 1))
    XCTAssert(neighboursof11.contains(0))
    XCTAssert(neighboursof11.contains(1))
    XCTAssert(neighboursof11.contains(2))
    XCTAssert(neighboursof11.contains(3))
    XCTAssert(neighboursof11.contains(5))
    XCTAssert(neighboursof11.contains(6))
    XCTAssert(neighboursof11.contains(7))
    XCTAssert(neighboursof11.contains(8))
    XCTAssert(neighboursof11.count == 8)

    let neighboursof12: [Int] = intField.getNeighbours(of: IntField2D.Coordinate(y: 1, x: 2))
    XCTAssert(neighboursof12.contains(1))
    XCTAssert(neighboursof12.contains(2))
    XCTAssert(neighboursof12.contains(4))
    XCTAssert(neighboursof12.contains(7))
    XCTAssert(neighboursof12.contains(8))
    XCTAssert(neighboursof12.count == 5)

    let neighboursof20: [Int] = intField.getNeighbours(of: IntField2D.Coordinate(y: 2, x: 0))
    XCTAssert(neighboursof20.contains(3))
    XCTAssert(neighboursof20.contains(4))
    XCTAssert(neighboursof20.contains(7))
    XCTAssert(neighboursof20.count == 3)

    let neighboursof21: [Int] = intField.getNeighbours(of: IntField2D.Coordinate(y: 2, x: 1))
    XCTAssert(neighboursof21.contains(3))
    XCTAssert(neighboursof21.contains(4))
    XCTAssert(neighboursof21.contains(5))
    XCTAssert(neighboursof21.contains(6))
    XCTAssert(neighboursof21.contains(8))
    XCTAssert(neighboursof21.count == 5)

    let neighboursof22: [Int] = intField.getNeighbours(of: IntField2D.Coordinate(y: 2, x: 2))
    XCTAssert(neighboursof22.contains(4))
    XCTAssert(neighboursof22.contains(5))
    XCTAssert(neighboursof22.contains(7))
    XCTAssert(neighboursof22.count == 3)

    let neighboursof22b: [Int] = intField.getNeighbours(of: IntField2D.Coordinate(y: 2, x: 2), includingSelf: true)
    XCTAssert(neighboursof22b.contains(4))
    XCTAssert(neighboursof22b.contains(5))
    XCTAssert(neighboursof22b.contains(7))
    XCTAssert(neighboursof22b.contains(8))
    XCTAssert(neighboursof22b.count == 4)

    let neighboursof12b: [Int] = intField.getNeighbours(of: IntField2D.Coordinate(y: 1, x: 2), includingSelf: true)
    XCTAssert(neighboursof12b.contains(1))
    XCTAssert(neighboursof12b.contains(2))
    XCTAssert(neighboursof12b.contains(4))
    XCTAssert(neighboursof12b.contains(5))
    XCTAssert(neighboursof12b.contains(7))
    XCTAssert(neighboursof12b.contains(8))
    XCTAssert(neighboursof12b.count == 6)
  }

  func testAddBox()
  {
    let intField: IntField2D = IntField2D(defaultValue: 0)
    intField.addBox()
    XCTAssert(1 == intField.getHeight())
    XCTAssert(1 == intField.getWidth())
    XCTAssert(0 == intField.getValue(at: IntField2D.Coordinate(y: 0, x: 0)))
    XCTAssert(nil == intField.getValue(at: IntField2D.Coordinate(y: -1, x: 0)))
    XCTAssert(nil == intField.getValue(at: IntField2D.Coordinate(y: -1, x: -1)))
    XCTAssert(nil == intField.getValue(at: IntField2D.Coordinate(y: -1, x: 1)))
    XCTAssert(nil == intField.getValue(at: IntField2D.Coordinate(y: 0, x: -1)))
    XCTAssert(nil == intField.getValue(at: IntField2D.Coordinate(y: 1, x: 0)))
    XCTAssert(nil == intField.getValue(at: IntField2D.Coordinate(y: 0, x: 1)))
    XCTAssert(nil == intField.getValue(at: IntField2D.Coordinate(y: 1, x: 1)))
    XCTAssert(nil == intField.getValue(at: IntField2D.Coordinate(y: 1, x: -1)))

    intField.setValue(1, at: IntField2D.Coordinate(y: 0, x: 0))
    intField.addBox()
    XCTAssert(3 == intField.getHeight())
    XCTAssert(3 == intField.getWidth())
    XCTAssert(0 == intField.getValue(at: IntField2D.Coordinate(y: 0, x: 0)))
    XCTAssert(nil == intField.getValue(at: IntField2D.Coordinate(y: -1, x: 0)))
    XCTAssert(nil == intField.getValue(at: IntField2D.Coordinate(y: -1, x: -1)))
    XCTAssert(nil == intField.getValue(at: IntField2D.Coordinate(y: -1, x: 1)))
    XCTAssert(nil == intField.getValue(at: IntField2D.Coordinate(y: 0, x: -1)))
    XCTAssert(nil == intField.getValue(at: IntField2D.Coordinate(y: 1, x: -1)))
    XCTAssert(0 == intField.getValue(at: IntField2D.Coordinate(y: 0, x: 1)))
    XCTAssert(0 == intField.getValue(at: IntField2D.Coordinate(y: 0, x: 2)))
    XCTAssert(0 == intField.getValue(at: IntField2D.Coordinate(y: 1, x: 0)))
    XCTAssert(1 == intField.getValue(at: IntField2D.Coordinate(y: 1, x: 1)))
    XCTAssert(0 == intField.getValue(at: IntField2D.Coordinate(y: 1, x: 2)))
    XCTAssert(0 == intField.getValue(at: IntField2D.Coordinate(y: 2, x: 0)))
    XCTAssert(0 == intField.getValue(at: IntField2D.Coordinate(y: 2, x: 1)))
    XCTAssert(0 == intField.getValue(at: IntField2D.Coordinate(y: 2, x: 2)))
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

  func testDay9Part1()
  {
    let partRunner: Day9Part1 = Day9Part1(verbose: true)
    XCTAssert("15" == partRunner.doStuff(with: Day9Input.EXAMPLE))
  }

  func testDay20Part1()
  {
    let partRunner: Day20Part1 = Day20Part1(verbose: true)
    XCTAssert("35" == partRunner.doStuff(with: Day20Input.EXAMPLE))
  }
}

