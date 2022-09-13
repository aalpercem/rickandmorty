//
//  EpisodeVM.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 1.09.2022.
//

import SwiftUI

class EpisodeVM: ObservableObject {

  @Published var episodeResults: [EpisodeResult] = []
  @Published var isPulled: Bool = false
  @Published var currentPage: Int = 1

  let emptyResult: [EpisodeResult] = []
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
          DispatchQueue.main.async {
            self.totalPage = episodes.info?.pages
            let _: [EpisodeResult] = episodes.results?.map { item in
              var episodeResult = EpisodeResult(id: "", name: .unknown, episode: .unknown , airDate: "", characters: [])
              if let item = item {

                var resultCharacters: [EpisodeCharacter] = []

                for character in item.characters {
                  // Add Character to List
                  resultCharacters.append(
                    EpisodeCharacter(
                      id: character?.id ?? "",
                      image: character?.image ?? "",
                      name: character?.name ?? "",
                      status: EpisodeCharacterStatus(rawValue: character?.status ?? "") ?? .unknown
                    )
                  )
                }

                // Add Episodes to List
                episodeResult =
                EpisodeResult(
                  id: item.id ?? "",
                  name: EpisodeName(rawValue: item.name ?? "") ?? .unknown,
                  episode: EpisodeEnum(rawValue: item.episode ?? "") ?? .unknown,
                  airDate: item.airDate ?? "",
                  characters: resultCharacters)
              }
              self.episodeResults.append(episodeResult)
              return episodeResult

            }  ?? self.emptyResult
            self.currentPage += 1
          }
        }
      case .failure(let error):
        print("Failure!! Error: \(error)")
      }
    }
  }

  func refreshEpisodeData() {
    guard isPulled && currentPage - 1 != totalPage else {
      return
    }
    fetchEpisodes(page: currentPage)
    self.isPulled = false
  }
  
}
