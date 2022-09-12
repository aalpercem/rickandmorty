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
        ForEach(vm.characterResults){ result in
          CharacterCardView(
            name: result.name,
            image: result.image,
            gender: result.gender.rawValue,
            status: result.status.rawValue,
            origin: result.origin
          )
          //.searchable(text: characterData.name))
        }
        .listRowSeparator(.hidden)
        .listRowBackground(Color("bgColor"))
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
//      .background(Color("bgColor"))
      .navigationTitle("Characters")
    }
  }
}

#if DEBUG
struct CharactersView_Previews: PreviewProvider {
  static var previews: some View {
    CharactersView(vm: CharacterVM())
  }
}
#endif
