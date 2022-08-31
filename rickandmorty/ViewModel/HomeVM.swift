//
//  HomeViewModel.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 18.07.2022.
//

import SwiftUI

class HomeVM: ObservableObject {
  //  @Published var searchQuery = ""
  @Published var characterResults: [CharacterResult] = []

  let emptyResult: [CharacterResult] = []

  init(){
    //    for page in 1...42 {
    fetchCharacters(page: 13)
    //    }
  }

  func fetchCharacters(page: Int){
    Network.shared.apollo.fetch(query: GetAllCharactersQuery(page: page)) {result in
      switch result {
      case let .success(response):
        print("Success! Result:\(response)")
        if let characters = response.data?.characters{
          DispatchQueue.main.async {
            let results: [CharacterResult] = characters.results?.map { item in
              var characterResult = CharacterResult(id: "", image: "", name: "", gender: .unknown, status: .unknown, origin: .init(id: "", name: .unknown, dimension: .unknown))
              if let item = item {
                characterResult = CharacterResult(id: item.id ?? "",
                                                  image: item.image ?? "",
                                                  name: item.name ?? "",
                                                  gender: CharacterGender(rawValue: (item.gender)!) ?? .unknown,
                                                  status: CharacterStatus(rawValue: (item.status)!) ?? .unknown,
                                                  origin: CharacterOrigin(id: item.origin?.id ?? "",
                                                                          // TODO: ?Burası Neden aynı çalışmıyor?
                                                                          name: Name(rawValue: (item.origin?.name)!) ?? .unknown,
                                                                          dimension:
                                                                            Dimension(rawValue: (item.origin?.dimension) ?? "unknown")
                                                                         ))
              }
              return characterResult
              //CharacterOrigin(rawValue: item?.origin)!) ?? nil
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

