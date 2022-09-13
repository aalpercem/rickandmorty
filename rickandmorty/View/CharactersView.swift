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

  var body: some View {
    NavigationView {
      List{
        ForEach(vm.characterResults){ result in
          ZStack{
            CharacterCardView(
              name: result.name,
              image: result.image,
              gender: result.gender.rawValue,
              status: result.status.rawValue,
              origin: result.origin
            )
            NavigationLink(destination:
                            CharacterDetailPage(
              image: result.image,
              name: result.name,
              gender: result.gender.rawValue,
              status: result.status.rawValue,
              originName: result.origin.name.rawValue ?? "",
              originDimension: result.origin.dimension?.rawValue ?? ""
            )) {
              EmptyView()
            }
            .opacity(0.0)
            .buttonStyle(PlainButtonStyle())
          }
          //.searchable(text: characterData.name))
        }
        .listRowSeparator(.hidden)
        .listRowBackground(Color("bgColor"))
      }
      .listStyle(PlainListStyle())
      .refreshable {
        vm.isPulled = true
        vm.refreshCharacterData()
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


struct CharactersView_Previews: PreviewProvider {
  static var previews: some View {
    CharactersView(vm: CharacterVM())
  }
}
