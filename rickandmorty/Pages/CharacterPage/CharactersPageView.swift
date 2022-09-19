//
//  CharactersPageView.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 18.07.2022.
//

import SwiftUI

struct CharactersPageView: View {

  @ObservedObject var vm: CharacterVM
  @State private var searchText = ""

  var body: some View {
    NavigationView {
      List{
        ForEach(vm.characterResults){ result in
          ZStack{
            CharacterCard(result: result)
            NavigationLink(
              destination:
                CharacterDetailPage(result: result)
            )
            {
              EmptyView()
            }
            .opacity(0.0)
            .buttonStyle(PlainButtonStyle())
          }
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
        UITableView.appearance().showsVerticalScrollIndicator = false
      }
      .searchable(text: $searchText, prompt: "Look for character")
      .onChange(of: searchText) { searchText in
        print("Text değişti")
        //TODO: This feature will be added in the future
      }
      .navigationTitle("Characters")
    }
  }
}


struct CharactersView_Previews: PreviewProvider {
  static var previews: some View {
    CharactersPageView(vm: CharacterVM())
  }
}
