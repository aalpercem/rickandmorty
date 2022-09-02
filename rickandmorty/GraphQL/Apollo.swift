//
//  Apollo.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 21.07.2022.
//

import Foundation
import Apollo

class Network {

  static let shared = Network()
  private init (){ }

  private let baseUrl = "https://rickandmortyapi.com/graphql"

  private(set) lazy var apollo = ApolloClient(url: URL(string: baseUrl)!)
}
