//
//  Home.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 18.07.2022.
//

import SwiftUI

struct Home: View {

  @StateObject var HomeData = HomeViewModel()
  
    var body: some View {
      TabView {

// TODO: Add Tags
        CharactersView().tabItem{
          Image(systemName: "person.3.fill")
          Text("Characters")
        }.environmentObject(HomeData)

        Text("Locations").tabItem{
          Image(systemName: "map.fill")
          Text("Locations")
        }.tag(1)

        Text("Episodes").tabItem{
          Image(systemName: "book.fill")
          Text("Episodes")
        }
      }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
