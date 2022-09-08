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
      //      ScrollView(.vertical, showsIndicators: false, content: {
      //      LazyVStack(alignment: .center, spacing: 0){
      List{
        ForEach(vm.episodeResults.indices, id: \.self) {
          resultIndex in
          let episodeResult = vm.episodeResults[resultIndex]
          EpisodeCard(
            id: episodeResult.id,
            name: episodeResult.name.rawValue,
            episodeCode: episodeResult.episode.rawValue,
            airDate: episodeResult.airDate,
            characters: episodeResult.characters
          )
          .listRowInsets(EdgeInsets())
        }
        .listRowSeparator(.hidden)
        .listRowBackground(Color("bgColor"))
      }

      .listStyle(PlainListStyle())
      .refreshable {
        isPulled.toggle()
        vm.refreshEpisodeData(isPulled: isPulled)
        isPulled.toggle()
      }
      .onAppear{
        //FIXME: Only Hides
        UITableView.appearance().showsVerticalScrollIndicator = false
      }
      //        }
      //      }
      //      )
//      .background(Color("bgColor"))
      .navigationTitle("Episodes")
    }
  }
}

//MARK: REMOVE
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
