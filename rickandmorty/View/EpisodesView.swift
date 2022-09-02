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
          VStack{
            ForEach(vm.episodeResults){ episodeData in
              EpisodeCard(id: episodeData.id, name: episodeData.name.rawValue, episodeCode: episodeData.episode.rawValue, airDate: episodeData.airDate, characters: episodeData.characters)

            }
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
