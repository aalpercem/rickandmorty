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
        ForEach(homeData.characterResults){ characterData in
          CharacterCardView(
            name: characterData.name,
            image: characterData.image,
            gender: "dummy gender",
            status: "dummy status")//.searchable(text: characterData.name)
        }
      .navigationTitle("Characters")
      })
    }
}
}


//struct CharactersView_Previews: PreviewProvider {
//  static var previews: some View {
//    CharactersView()
//  }
//}
