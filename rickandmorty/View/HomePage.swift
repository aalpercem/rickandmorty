//
//  Home.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 18.07.2022.
//

import SwiftUI

struct Home: View {

  @State var isLoading = false
  
  var body: some View {
    TabView {
      CharactersView(vm: HomeVM()).tabItem{
        Image(systemName: "person.3.fill")
        Text("Characters")
      }
      .tag("CharactersTab")

      LocationsView(vm: LocationsVM()).tabItem{
        Image(systemName: "map.fill")
        Text("Locations")
      }
      .tag("LocationsTab")

      EpisodesView(vm: EpisodeVM()).tabItem{
        Image(systemName: "book.fill")
        Text("Episodes")
      }
      .tag("EpisodesTab")
    }
    .overlay(loadingOverlay)
  }

  @ViewBuilder private var loadingOverlay: some View {
    if isLoading {
      LaunchScreen()
    }

  }

}

#if DEBUG
struct Home_Previews: PreviewProvider {
  static var previews: some View {
    Home()
  }
}
#endif
