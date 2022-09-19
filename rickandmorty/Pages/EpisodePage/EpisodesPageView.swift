//
//  EpisodesPageView.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 2.09.2022.
//

import SwiftUI

struct EpisodesPageView: View {

  @ObservedObject var vm: EpisodeVM

  var body: some View {
    NavigationView {
      List{
        ForEach(vm.episodeResults) { result in
          ZStack{
            EpisodeCard(result: result)
            NavigationLink(
              destination:EpisodeDetailPage(result: result)
            )
            {
              EmptyView()
            }
            .opacity(0.0)
            .buttonStyle(PlainButtonStyle())
          }
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
        UITableView.appearance().showsVerticalScrollIndicator = false
      }
      .navigationTitle("Episodes")
    }
  }
}


//
//MARK: May be added in the future
//public struct RefreshableScrollView<Content: View>: View {
//  var content: Content
//  var onRefresh: () async -> ()
//
//  init(
//    content: @escaping () -> Content,
//    onRefresh: @escaping () async -> ()
//  ) {
//    self.content = content()
//    self.onRefresh = onRefresh
//  }
//
//  public var body: some View {
//    List {
//      content
//    }
//    .listStyle(.plain)
//    .refreshable {
//      await onRefresh()
//    }
//  }
//}

struct EpisodesView_Previews: PreviewProvider {
  static var previews: some View {
    EpisodesPageView(vm: EpisodeVM())
  }
}
