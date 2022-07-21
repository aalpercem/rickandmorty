//
//  CharactersView.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 18.07.2022.
//

import SwiftUI

struct CharactersView: View {
  @EnvironmentObject var homeData: HomeViewModel
  var body: some View {


    NavigationView {
      ScrollView(.vertical, showsIndicators: false, content: {
        CharacterCardView()
        CharacterCardView()
        CharacterCardView()
        CharacterCardView()
        CharacterCardView()
        CharacterCardView()
        CharacterCardView()
        CharacterCardView()
        CharacterCardView()
      })
      .navigationTitle("Characters")
    }

  }


}

struct CharactersView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
