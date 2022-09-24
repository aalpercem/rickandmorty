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
        ForEach(vm.episodeResults.indices, id:\.self) { resultIndex in
          let result = vm.episodeResults[resultIndex]
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
          .onAppear{
            vm.reloadMoreData(resultIndex: resultIndex)
          }
        }
        .listRowSeparator(.hidden)
        .listRowBackground(Color("bgColor"))

        if vm.shouldReload() {
          self.LoadingView()
            .frame(width: screenWidth,
                   height: 100,
                   alignment: .center
            )
            .background(Color("bgColor"))
            .offset(x: -20, y: -6)
            .listRowSeparator(.hidden)
        }
      }
      .listStyle(PlainListStyle())
      .onAppear{
        UITableView.appearance().showsVerticalScrollIndicator = false
      }
      .navigationTitle("Episodes")
    }
  }

  func LoadingView() -> some View {
    return VStack(spacing: 15) {
      ProgressView()
        .progressViewStyle(
          CircularProgressViewStyle(tint: .gray))
        .scaleEffect(2)
      Text("Loading...")
    }
  }
}


struct EpisodesView_Previews: PreviewProvider {
  static var previews: some View {
    EpisodesPageView(vm: EpisodeVM())
  }
}
