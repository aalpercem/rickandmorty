//
//  CharacterVM.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 18.07.2022.
//

import SwiftUI

class CharacterVM: ObservableObject {

  //  @Published var searchQuery = ""
  @Published var characterResults: [CharacterResult] = []
  @Published var currentPage: Int = 1

  var totalPage: Int? = nil

  init(){
    fetchCharacters(page: currentPage)
  }

  func fetchCharacters(page: Int){

    print("Getting Characters: \(page)")

    Network.shared.apollo.fetch(query: GetAllCharactersQuery(page: page)) {result in
      switch result {
      case let .success(response):
        print("Success! Result:\(response)")
        if let characters = response.data?.characters{

          self.totalPage = characters.info?.pages

          characters.results?.forEach { item in
            if let item = item {

              let characterResult = CharacterResult(
                id: item.id ?? "",
                image: item.image ?? "",
                name: item.name ?? "",
                gender: CharacterGender(rawValue: (item.gender)!) ?? .unknown,
                status: CharacterStatus(rawValue: (item.status)!) ?? .unknown,
                origin: CharacterOrigin(
                  id: item.origin?.id ?? "",
                  name: Name(rawValue: (item.origin?.name) ?? "unknown") ?? .unknown,
                  dimension:
                    Dimension(rawValue: (item.origin?.dimension) ?? "unknown")
                ))
              self.characterResults.append(characterResult)
            }
          }
          //TODO: Trigger event for change currentPage (Event new page requested)
          self.currentPage += 1

        }
      case .failure(let error):
        print("Failure!! Error: \(error)")
      }
    }
  }

  //MARK: Infinite scrolling
  func reloadMoreData (resultIndex: Int) {
    if resultIndex == characterResults.count - 2{
      guard currentPage - 1 != totalPage else {
        return
      }
      fetchCharacters(page: currentPage)
    }
  }

  func shouldReload () -> Bool{
    guard currentPage - 1 != totalPage else {
      return false
    }
    return true
  }
}

