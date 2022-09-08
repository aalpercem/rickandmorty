//
//  HomePage.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 18.07.2022.
//

import SwiftUI

struct HomePage: View {


  @EnvironmentObject var launchScreenManager: LaunchScreenManager
  
  var body: some View {
    TabView {
      CharactersView(vm: CharacterVM()).tabItem{
        Image(systemName: "person.3.fill")
        Text("Characters")
      }
      .tag("CharactersTab")

      LocationsView(vm: LocationVM()).tabItem{
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
    .onAppear{
      DispatchQueue.main.asyncAfter(deadline: .now() + 5){
        launchScreenManager.dismiss()
      }
    }
  }
}

#if DEBUG
struct Home_Previews: PreviewProvider {
  static var previews: some View {
    HomePage().environmentObject(LaunchScreenManager())
  }
}
#endif
