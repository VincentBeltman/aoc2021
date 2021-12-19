//
//  SnailMath.swift
//  AdventOfCode2021
//
//  Created by Inspiro developer on 19/12/2021.
//

import Foundation

class SnailMath
{
  class Node
  {
    enum NodeType
    {
      case ROOT
      case LEFT
      case RIGHT
    }

    class Pair
    {
      var leftVal: Int
      var rightVal: Int
      init(leftVal: Int, rightVal: Int)
      {
        self.leftVal = leftVal
        self.rightVal = rightVal
      }
    }

    var type: NodeType
    var value: Int?
    var leftNode: Node?
    var rightNode: Node?
    weak var parent: Node?

    init(value: Int, type: NodeType = .ROOT, parent: Node? = nil)
    {
      self.type = type
      self.value = value
      self.parent = parent
    }

    init(left: Node, rawRight: [Character], parent: Node? = nil)
    {
      self.type = .ROOT
      self.leftNode = left
      self.leftNode!.type = .LEFT
      self.leftNode!.parent = self
      self.rightNode = Node(raw: rawRight, type: .RIGHT, parent: self)
      self.parent = parent
    }

    init(raw: [Character], type: NodeType = .ROOT, parent: Node? = nil)
    {
      self.type = type
      self.parent = parent
      if raw[0] == "["
      {
        // Skip outer most characters
        let leftFirst: Int = 1
        var leftLast: Int = 0
        var rightFirst: Int = 0
        let rightLast: Int = raw.count-2

        var depth = 0
        // TODO: Perforamnce improvement by mapping all tokens
        for index in leftFirst...rightLast
        {
          if raw[index] == "["
          {
            depth += 1
          }
          else if raw[index] == "]"
          {
            depth -= 1
          }
          else if raw[index] == "," && depth == 0
          {
            leftLast = index-1
            rightFirst = index+1
            break
          }
        }
        assert(leftLast > 0)
        assert(rightFirst > 0)

        leftNode = Node(raw: Array(raw[leftFirst...leftLast]), type: .LEFT, parent: self)
        rightNode = Node(raw: Array(raw[rightFirst...rightLast]), type: .RIGHT, parent: self)
      }
      else
      {
        assert(raw.count == 1)
        value = Int(raw[0].wholeNumberValue!)
      }
    }

    func getValue() -> Int
    {
      return value!
    }

    func handleExplodedValue(pair: Pair, callingType: NodeType, resetCaller: Bool)
    {
      if callingType == .LEFT
      {
        if pair.rightVal > -1
        {
          if resetCaller
          {
            leftNode = Node(value: 0, type: .LEFT, parent: self)
          }
          rightNode!.setLeftMostValue(pair.rightVal)
          pair.rightVal = -1
        }
        if pair.leftVal > 0
        {
          parent?.handleExplodedValue(pair: pair, callingType: type, resetCaller: false)
        }
      }
      else
      {
        if pair.leftVal > -1
        {
          if resetCaller
          {
            rightNode = Node(value: 0, type: .RIGHT, parent: self)
          }
          leftNode!.setRightMostValue(pair.leftVal)
          pair.leftVal = -1
        }
        if pair.rightVal > 0
        {
          parent?.handleExplodedValue(pair: pair, callingType: type, resetCaller: false)
        }
      }
    }

    func setLeftMostValue(_ newValue: Int)
    {
      if value != nil
      {
        value! += newValue
      }
      else
      {
        self.leftNode?.setLeftMostValue(newValue)
      }
    }

    func setRightMostValue(_ newValue: Int)
    {
      if value != nil
      {
        value! += newValue
      }
      else
      {
        self.rightNode?.setRightMostValue(newValue)
      }
    }

    func explode(currentDepth: Int = 1) -> Bool
    {
      var hasExploded: Bool = false
      if value == nil
      {
        if currentDepth == 5
        {
          parent!.handleExplodedValue(pair: Pair(leftVal: leftNode!.getValue(), rightVal: rightNode!.getValue()), callingType: type, resetCaller: true)
          hasExploded = true
        }
        else
        {
          hasExploded = leftNode!.explode(currentDepth: currentDepth+1)
          hasExploded = rightNode!.explode(currentDepth: currentDepth+1) || hasExploded
        }
      }
      return hasExploded
    }

    func split(currentDepth: Int = 1) -> Bool
    {
      var hasSplit: Bool = false
      if value == nil
      {
        hasSplit = leftNode!.split(currentDepth: currentDepth + 1)
        if !hasSplit
        {
          hasSplit = rightNode!.split(currentDepth: currentDepth + 1) || hasSplit
        }
      }
      else if value! >= 10
      {
        hasSplit = true
        let leftValue: Int = Int(value!/2)
        let rightValue: Int = value! - leftValue
        if currentDepth == 5
        {
          parent!.handleExplodedValue(pair: Pair(leftVal: leftValue, rightVal: rightValue), callingType: type, resetCaller: true)
        }
        else
        {
          leftNode = Node(value: leftValue, type: .LEFT, parent: self)
          rightNode = Node(value: rightValue, type: .RIGHT, parent: self)
          value = nil
        }
      }
      return hasSplit
    }

    func toString() -> String
    {
      if let value = value
      {
        return "\(value)"
      }

      return "[\(leftNode!.toString()),\(rightNode!.toString())]"
    }

    func calculateMagnitude() -> Int
    {
      if let value = value
      {
        return value
      }
      return leftNode!.calculateMagnitude() * 3 + rightNode!.calculateMagnitude() * 2
    }
  }

  private var formula: Node? = nil

  var sum: String {
    get {
      return formula != nil ? formula!.toString() : ""
    }
  }

  var magnitude: Int {
    get {
      return formula!.calculateMagnitude()
    }
  }

  func add(raw: String)
  {
    var toAdd: [Character] = []
    for character in raw
    {
      toAdd.append(character)
    }

    if formula != nil
    {
      formula = Node(left: formula!, rawRight: toAdd)
    }
    else
    {
      formula = Node(raw: toAdd)
    }

    var hasExplotionPotential: Bool = true
    while hasExplotionPotential
    {
      hasExplotionPotential = formula!.explode()
    }
    var hasSplitPotential: Bool = true
    while hasSplitPotential
    {
      hasSplitPotential = formula!.split()
    }
  }
}
