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
      //      ScrollView(.vertical, showsIndicators: false, content: {
      //      LazyVStack(alignment: .center, spacing: 0){
      List{
        ForEach(vm.episodeResults) {
          result in
          EpisodeCard(
            id: result.id,
            name: result.name.rawValue,
            episodeCode: result.episode.rawValue,
            airDate: result.airDate,
            characters: result.characters
          )
          .listRowInsets(EdgeInsets())
        }
        .listRowSeparator(.hidden)
        .listRowBackground(Color("bgColor"))
      }

      .listStyle(PlainListStyle())
      .refreshable {
        vm.isPulled = true
        vm.refreshEpisodeData()
      }
      .onAppear{
        //FIXME: Only Hides
        UITableView.appearance().showsVerticalScrollIndicator = false
      }
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
