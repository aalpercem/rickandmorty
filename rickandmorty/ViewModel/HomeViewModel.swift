//
//  HomeViewModel.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 18.07.2022.
//

import SwiftUI

class HomeViewModel: ObservableObject {

  @Published var characters: [Characters] = []

//  let result: Result

  init(){
    fetchData()
  }

  func fetchData(){
    Network.shared.apollo.fetch(query: GetAllCharactersQuery()) {result in
      switch result {
      case .success(let GraphQLResult):
        print("Success! Result:\(GraphQLResult)")
//        if let characters = GraphQLResult.data?.characters{
          DispatchQueue.main.async {

//           self.characters = characters
//          }
        }
      case .failure(let error):
        print("Failure!! Error: \(error)")
      }
    }

  }

//  func processData(data: CharacterData) -> [Characters] {
//    return DataClass(data).characters
//
//  }
}

