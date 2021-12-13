//
//  Day13Part1.swift
//  AdventOfCode2021
//
//  Created by Inspiro developer on 13/12/2021.
//

import Foundation

class Day13Part1: PartRunner
{
  override func doStuff(with input: String) -> String
  {
    let parts: [String] = input.components(separatedBy: "\n\n")
    let field: StringField2D = StringField2D(defaultValue: ".")

    for coordinate in parts[0].split(separator: "\n")
    {
      let coordinateRaw: [String.SubSequence] = coordinate.split(separator: ",")
      field.setValue("#", at: StringField2D.Coordinate(y: Int(coordinateRaw[1])!, x: Int(coordinateRaw[0])!))
    }

    for fold in parts[1].split(separator: "\n")
    {
      let parsedFold: (String, Int) = parseFold(String(fold))
      if parsedFold.0 == "x"
      {
        foldVertical(field, at: parsedFold.1)
        field.cutVertical(from: parsedFold.1)
      }
      else if parsedFold.0 == "y"
      {
        foldHorizontal(field, at: parsedFold.1)
        field.cutHorizontal(from: parsedFold.1)
      }
      else
      {
        assert(false, "Should not happen pancake")
      }
//      break // Part 1 is 1 fold only
    }
    print(field.toString())

    return "\(field.countNrOfOccurrences(equalTo: "#"))"
  }

  func foldVertical(_ field: StringField2D, at foldIndex: Int)
  {
    for y in 0..<field.getHeight()
    {
      for x in (foldIndex+1)..<field.getWidth()
      {
        let coordinate: StringField2D.Coordinate = StringField2D.Coordinate(y: y, x: x)
        if field.getValue(at: coordinate) == "#"
        {
          field.setValue("#", at: StringField2D.Coordinate(y: y, x: (field.getWidth() - x - 1)))
        }
      }
    }
  }

  func foldHorizontal(_ field: StringField2D, at foldIndex: Int)
  {
    for y in (foldIndex+1)..<field.getHeight()
    {
      for x in 0..<field.getWidth()
      {
        let coordinate: StringField2D.Coordinate = StringField2D.Coordinate(y: y, x: x)
        if field.getValue(at: coordinate) == "#"
        {
          field.setValue("#", at: StringField2D.Coordinate(y: (field.getHeight() - y - 1), x: x))
        }
      }
    }
  }

  func parseFold(_ fold: String) -> (String, Int)
  {
    let regex = try! NSRegularExpression(pattern: "fold along ([xy])=(\\d+)")
    let result: NSTextCheckingResult = regex.matches(in: String(fold), range: NSRange(fold.startIndex..., in: fold)).first!
    return (
      String(fold[Range(result.range(at: 1), in: fold)!]),
      Int(fold[Range(result.range(at: 2), in: fold)!])!)
  }

  override func cleanUp()
  {
  }
}
