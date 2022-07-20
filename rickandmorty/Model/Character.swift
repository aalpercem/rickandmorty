//
//  Character.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 18.07.2022.
//

import SwiftUI

struct Character: Identifiable,Codable {
  var id: Int
  var name: String
  var status: String
  var species: String
  var type: String
  var gender: String
  //object var origin:
  //object var location:
  var image: String //URL

}

