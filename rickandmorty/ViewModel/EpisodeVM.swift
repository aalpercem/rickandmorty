//
//  EpisodeVM.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 1.09.2022.
//

import SwiftUI

class EpisodeVM: ObservableObject {

  @Published var episodeResults: [EpisodeResult] = []

  let emptyResult: [EpisodeResult] = []

  init(){
    fetchEpisodes(page: 1)
  }

  func fetchEpisodes(page: Int){
    Network.shared.apollo.fetch(query: GetAllEpisodesQuery(page: page)) { result in
      switch result {
      case let .success(response):
        print("Success! Result:\(response)")
        if let episodes = response.data?.episodes{
          DispatchQueue.main.async {
            let results: [EpisodeResult] = episodes.results?.map { item in
              var episodeResult = EpisodeResult(id: "", name: .unknown, episode: .unknown , airDate: "", characters: [])
              if let item = item {

                var resultCharacters: [EpisodeCharacter] = []
                var characterEpisodes: [EpisodeElement] = []

                for character in item.characters {

                  // Add Character to List
                  resultCharacters.append(
                    EpisodeCharacter(
                      id: character?.id ?? "",
                      image: character?.image ?? "",
                      name: character?.name ?? "",
                      status: EpisodeCharacterStatus(rawValue: character?.status ?? "") ?? .unknown,
                      gender: EpisodeCharacterGender(rawValue: character?.gender ?? "") ?? .unknown,
                      location:
                        EpisodeCharacterLocation(id: character?.location?.id ?? "", name: character?.location?.name ?? "", dimension: EpisodeCharacterLocationDimension(rawValue: character?.location?.dimension ?? "") ?? .unknown),
                      episode: characterEpisodes
                    )
                  )
                }

                // Add Episodes to List
                episodeResult = EpisodeResult(id: item.id ?? "", name: EpisodeName(rawValue: item.name ?? "") ?? .unknown, episode: EpisodeEnum(rawValue: item.episode ?? "") ?? .unknown, airDate: item.airDate ?? "", characters: resultCharacters)
              }

              return episodeResult

            }  ?? self.emptyResult

            self.episodeResults = results
          }
        }
      case .failure(let error):
        print("Failure!! Error: \(error)")
      }



    }
  }
}