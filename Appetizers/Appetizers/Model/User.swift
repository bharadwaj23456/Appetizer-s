//
//  User.swift
//  Appetizers
//
//  Created by Reddy Bharadwaj Chowdary on 01/08/24.
//

import Foundation


struct User : Codable {
    
  var  firstName         = ""
  var  lastName          = ""
  var  email              = ""
  var  birthday          = Date()
  var  extraNapkins      = false
  var  frequentRefill    = false
    
}
