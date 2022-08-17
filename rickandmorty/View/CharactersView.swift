//
//  CharactersView.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 18.07.2022.
//

import SwiftUI

struct CharactersView: View {
  @EnvironmentObject var homeData: HomeVM
  var body: some View {

    NavigationView {
      ScrollView(.vertical, showsIndicators: false, content: {
        VStack{
          ForEach(homeData.characterResults){ characterData in
            CharacterCardView(
              name: characterData.name,
              image: characterData.image,
              gender: characterData.gender,
              status: characterData.status,
              origin: characterData.origin)

  //          .searchable(text: characterData.name))
          }
        }
      .navigationTitle("Characters")
      })
    }
}
}


//struct CharactersView_Previews: PreviewProvider {
//  static var previews: some View {
//    CharacterCardView(name: "Rick", image: "Sanchez", gender: "Male", status: "Alive", origin: "Earth")
//  }
//}
