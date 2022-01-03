//
//  Day20Part1.swift
//  AdventOfCode2021
//
//  Created by Inspiro developer on 03/01/2022.
//

import Foundation

class Day20Part1: PartRunner
{
  override func doStuff(with input: String) -> String
  {
    let parts: [String] = input.components(separatedBy: "\n\n")
    let enhanceAlgorithm: String = parts[0]
    let input: String = parts[1]
    var image: IntField2D = IntField2D(defaultValue: 0, enableDiagonals: true)

    for (y, line) in input.split(separator: "\n").enumerated()
    {
      for (x, pixel) in line.enumerated()
      {
        image.setValue(pixel == "#" ? 1 : 0, at: IntField2D.Coordinate(y: y, x: x))
      }
    }

    image.addBox()
    image.addBox()

    for _ in 0..<2
    {
      image = enhance(image: image, with: enhanceAlgorithm)

      var total: Int = 0
      for coordinate in image
      {
        if image.getValue(at: coordinate) == 1
        {
          total += 1
        }
      }
    }

    var total: Int = 0
    var temp: Int = 0
    for coordinate in image
    {
      temp += 1
      if image.getValue(at: coordinate) == 1
      {
        total += 1
      }
    }

    return "\(total)"
  }

  func enhance(image: IntField2D, with enhanceAlgorithm: String) -> IntField2D
  {
    let newDefault = image.getDefaultValue() == 1 || enhanceAlgorithm[0] == "." ? 0 : 1
    let enhancedImage: IntField2D = IntField2D(defaultValue: newDefault, enableDiagonals: true)
    for coordinate in image where (coordinate.x > 0) && (coordinate.x < image.getWidth()-1) && (coordinate.y > 0) && (coordinate.y < image.getHeight()-1)
    {
      var algorithmIndex: Int = 0
      for neighbour in image.getNeighbours(of: coordinate, includingSelf: true)
      {
        algorithmIndex = algorithmIndex << 1
        algorithmIndex += neighbour
      }

      // TODO: Slight improvement if preparsed
      enhancedImage.setValue(enhanceAlgorithm[algorithmIndex] == "#" ? 1 : 0, at: IntField2D.Coordinate(y: coordinate.y+1, x: coordinate.x+1))
    }
    enhancedImage.resize(to: IntField2D.Coordinate(y: enhancedImage.getHeight()+1, x: enhancedImage.getWidth()+1))

    return enhancedImage
  }

  override func cleanUp()
  {
  }
}
