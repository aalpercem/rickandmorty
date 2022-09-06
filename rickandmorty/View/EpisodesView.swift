//
//  EpisodesView.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 2.09.2022.
//

import SwiftUI

struct EpisodesView: View {

  @ObservedObject var vm: EpisodeVM
  @State var isPulled: Bool = false

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
              //              vm.initalData()
            }
            //            .refreshable {
            //              isPulled.toggle()
            //              vm.refreshData(isPull: isPulled)
            //            }
          }
          //          .onAppear(){
          //            vm.initalData()
          //          }
        }
      }

                 //      }
      )
      .navigationTitle("Episodes")
    }
  }
}

public struct RefreshableScrollView<Content: View>: View {
  var content: Content
  var onRefresh: () async -> ()

  init(
    content: @escaping () -> Content,
    onRefresh: @escaping () async -> ()
  ) {
    self.content = content()
    self.onRefresh = onRefresh
  }

  public var body: some View {
    List {
      content
    }
    .listStyle(.plain)
    .refreshable {
      await onRefresh()
    }
  }
}


#if DEBUG
struct EpisodesView_Previews: PreviewProvider {
  static var previews: some View {
    EpisodesView(vm: EpisodeVM())
  }
}
#endif
