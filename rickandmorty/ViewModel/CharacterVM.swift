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

  let emptyResult: [CharacterResult] = []

  var currentPage = 1
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
          DispatchQueue.main.async {
            self.totalPage = characters.info?.pages
            let _: [CharacterResult] = characters.results?.map { item in
              var characterResult = CharacterResult(id: "", image: "", name: "", gender: .unknown, status: .unknown, origin: .init(id: "", name: .unknown, dimension: .unknown))
              if let item = item {
                characterResult = CharacterResult(
                  id: item.id ?? "",
                  image: item.image ?? "",
                  name: item.name ?? "",
                  gender: CharacterGender(rawValue: (item.gender)!) ?? .unknown,
                  status: CharacterStatus(rawValue: (item.status)!) ?? .unknown,
                  origin: CharacterOrigin(
                    id: item.origin?.id ?? "",
                    // TODO: ?Burası Neden aynı çalışmıyor?
                    name: Name(rawValue: (item.origin?.name)!) ?? .unknown,
                    dimension:
                      Dimension(rawValue: (item.origin?.dimension) ?? "unknown")
                  ))
              }
              self.characterResults.append(characterResult)
              return characterResult

            } ?? self.emptyResult

            self.currentPage += 1
          }
        }
      case .failure(let error):
        print("Failure!! Error: \(error)")
      }
    }
  }

  //MARK: For scrolling
  func reloadMoreData (resultIndex: Int) {
    if resultIndex == characterResults.count - 2{
      guard currentPage - 1 != totalPage else {
        return
      }
      fetchCharacters(page: currentPage)
    }
  }

  func refreshCharacterData(isPulled: Bool) {
    guard isPulled && currentPage - 1 != totalPage else {
      return
    }
    fetchCharacters(page: currentPage)
  }
}

