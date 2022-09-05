//
//  EpisodesView.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 2.09.2022.
//

import SwiftUI

struct EpisodesView: View {

  @ObservedObject var vm: EpisodeVM

  var body: some View {
    NavigationView {
      ScrollView(.vertical, showsIndicators: false, content: {
        LazyVStack{
          ForEach(vm.episodeResults.indices, id: \.self){ resultindex in
            let episodeResults = vm.episodeResults[resultindex]
            EpisodeCard(
              id: episodeResults.id,
              name: episodeResults.name.rawValue,
              episodeCode: episodeResults.episode.rawValue,
              airDate: episodeResults.airDate,
              characters: episodeResults.characters
            )
            .onAppear{
              vm.reloadMoreData(resultIndex: resultindex)
            }
          }
        }
      }
      )
      .navigationTitle("Episodes")
    }
  }
}


//
//struct EpisodesView_Previews: PreviewProvider {
//    static var previews: some View {
//        EpisodesView()
//    }
//}
