//
//  CharactersView.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 18.07.2022.
//

import SwiftUI

struct CharactersView: View {

  @EnvironmentObject var homeData: HomeVM
  @State private var searchText = ""



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
              origin: characterData.origin
            )

  //          .searchable(text: characterData.name))
          }
        }
      .searchable(text: $searchText, prompt: "Look for character")
      .onChange(of: searchText) { searchText in

      }
      .navigationTitle("Characters")
      })
    }

    }


}


#if DEBUG
struct CharactersView_Previews: PreviewProvider {
  static var previews: some View {
    VStack{
      CharacterCardView(name: "Rick", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", gender: CharacterGender.male, status: CharacterStatus.alive, origin: CharacterOrigin.init(id: "101", name: Name.earthC137)
      )
  }
  }
}
#endif
