//
//  HomeViewModel.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 18.07.2022.
//

import SwiftUI

class HomeViewModel: ObservableObject {

  //  @Published var characters: [Characters] = []
  @Published var characterResults: [Result] = []

  let emptyResult: [Result] = []

  init(){
    fetchData()
  }

  func fetchData(){
    Network.shared.apollo.fetch(query: GetAllCharactersQuery()) {result in
      switch result {
      case let .success(response):
        print("Success! Result:\(response)")
        if let characters = response.data?.characters{
          DispatchQueue.main.async {
            let results: [Result] = characters.results?.map { item in
              Result(id: item?.id ?? "",
                     image: item?.image ?? "",
                     name: item?.name ?? "",
                     gender: nil,
                     status: nil)
            } ?? self.emptyResult

            self.characterResults = results

          }

        }
      case .failure(let error):
        print("Failure!! Error: \(error)")
      }
    }

  }
}

