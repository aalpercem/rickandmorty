//
//  HomePage.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 18.07.2022.
//

import SwiftUI


struct HomePage: View {

  var body: some View {
    TabView {
      CharactersPageView(vm: CharacterVM())
        .tabItem{
          Image(systemName: "person.3.fill")
          Text("Characters")
        }
        .tag("CharactersTab")

      LocationsPageView(vm: LocationVM())
        .tabItem{
          Image(systemName: "map.fill")
          Text("Locations")
        }
        .tag("LocationsTab")

      EpisodesPageView(vm: EpisodeVM())
        .tabItem{
          Image(systemName: "book.fill")
          Text("Episodes")
        }
        .tag("EpisodesTab")
    }
  }
}

struct Home_Previews: PreviewProvider {
  static var previews: some View {
    HomePage()
  }
}
