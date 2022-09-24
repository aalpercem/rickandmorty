//
//  EpisodeVM.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 1.09.2022.
//

import SwiftUI

class EpisodeVM: ObservableObject {

  @Published var episodeResults: [EpisodeResult] = []
  @Published var currentPage: Int = 1

  var totalPage: Int? = nil

  init(){
    fetchEpisodes(page: currentPage)
  }

  func fetchEpisodes(page: Int) {

    print("Getting Episodes: \(page)")

    Network.shared.apollo.fetch(query: GetAllEpisodesQuery(page: page)) { result in
      switch result {
      case let .success(response):
        print("Success! Result:\(response)")
        if let episodes =   response.data?.episodes{

          self.totalPage = episodes.info?.pages

          episodes.results?.forEach { item in

            if let item = item {

              var resultCharacters: [EpisodeCharacter] = []

              for character in item.characters {
                resultCharacters.append(
                  EpisodeCharacter(
                    id: character?.id ?? "",
                    image: character?.image ?? "",
                    name: character?.name ?? "",
                    status: EpisodeCharacterStatus(rawValue: character?.status ?? "") ?? .unknown
                  )
                )
              }
              let episodeResult =
              EpisodeResult(
                id: item.id ?? "",
                name: EpisodeName(rawValue: item.name ?? "") ?? .unknown,
                episode: EpisodeEnum(rawValue: item.episode ?? "") ?? .unknown,
                airDate: item.airDate ?? "",
                characters: resultCharacters)
              self.episodeResults.append(episodeResult)
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
    if resultIndex == episodeResults.count - 1{
      guard currentPage - 1 != totalPage else {
        return
      }
      fetchEpisodes(page: currentPage)
    }
  }

  func shouldReload () -> Bool{
    guard currentPage - 1 != totalPage else {
      return false
    }
    return true
  }
}
