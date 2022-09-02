//
//  EpisodesView.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 2.09.2022.
//

import SwiftUI

struct EpisodesView: View {

  @ObservedObject var vm: EpisodeVM
//  @State private var currentPage = 0

  var body: some View {
    NavigationView {
      ScrollView(.vertical, showsIndicators: false, content: {
        LazyVStack{

          ForEach(vm.episodeResults){ episodeData in
            EpisodeCard(
              id: episodeData.id,
              name: episodeData.name.rawValue,
              episodeCode: episodeData.episode.rawValue,
              airDate: episodeData.airDate,
              characters: episodeData.characters
            )
            .onAppear{
              // if last item !!!!!!!!!!!
              //

              // vm.fetchEpisodes(page: )
            }

          }

          //          ForEach (vm.episodeResults) { index in
          //            let episodeResults = vm.episodeResults[index]
          //
          //            EpisodeCard(
          //              id: episodeResults[index].id,
          //              name: episodeResults[index].name.rawValue,
          //              episodeCode: episodeResults[index].episode.rawValue,
          //              airDate: episodeResults[index].airDate,
          //              characters: episodeResults[index].characters
          //            )
          //          }
        }

      })
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
