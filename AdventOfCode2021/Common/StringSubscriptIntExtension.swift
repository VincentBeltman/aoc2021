//
//  StringSubscriptIntExtension.swift
//  AdventOfCode2021
//
//  Created by Inspiro developer on 14/12/2021.
//

import Foundation

extension StringProtocol
{
  subscript(offset: Int) -> Character
  {
    self[index(startIndex, offsetBy: offset)]
  }
}
