//
//  CharactersView.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 18.07.2022.
//

import SwiftUI

struct CharactersView: View {

  @ObservedObject var vm: CharacterVM
  @State private var searchText = ""
  @State var isPulled: Bool = false

  var body: some View {

    NavigationView {
      List{
        ForEach(vm.characterResults.indices, id:\.self){ resultIndex in
          let characterResult = vm.characterResults[resultIndex]
          CharacterCardView(
            name: characterResult.name,
            image: characterResult.image,
            gender: characterResult.gender.rawValue,
            status: characterResult.status.rawValue,
            origin: characterResult.origin
          )
          //.searchable(text: characterData.name))
        }
        .listRowSeparator(.hidden)
      }
      .listStyle(PlainListStyle())
      .refreshable {
        isPulled.toggle()
        vm.refreshCharacterData(isPulled: isPulled)
        isPulled.toggle()
      }
      .onAppear{
        //FIXME: Only Hides
        UITableView.appearance().showsVerticalScrollIndicator = false
      }
      .searchable(text: $searchText, prompt: "Look for character")
      .onChange(of: searchText) { searchText in
        print("Text değişti")
      }
      .navigationTitle("Characters")
    }
  }
}

#if DEBUG
struct CharactersView_Previews: PreviewProvider {
  static var previews: some View {
    CharacterCardView(
      name: "Rick",
      image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
      gender: "Male",
      status: "Alive",
      origin: CharacterOrigin.init(id: "101", name: Name.earthC137)
    )
  }
}
#endif
