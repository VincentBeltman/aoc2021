//
//  StringIsInAllCapsExtension.swift
//  AdventOfCode2021
//
//  Created by Inspiro developer on 12/12/2021.
//

import Foundation

extension String
{
  var isInAllCaps: Bool {
    get
    {
      for character in self where !character.isUppercase
      {
        return false
      }
      return true
    }
  }
}
