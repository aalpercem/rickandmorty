//
//  Home.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 18.07.2022.
//

import SwiftUI

struct Home: View {

  @StateObject var HomeData = HomeVM()
  
    var body: some View {
      TabView {
        CharactersView().tabItem{
          Image(systemName: "person.3.fill")
          Text("Characters")
        }
        .environmentObject(HomeData)
        .tag("CharactersTab")


        LocationsView(vm: LocationsVM()).tabItem{
          Image(systemName: "map.fill")
          Text("Locations")
        }
        .tag("LocationsTab")

        Text("Episodes").tabItem{
          Image(systemName: "book.fill")
          Text("Episodes")
        }
        .tag("EpisodesTab")

      }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
