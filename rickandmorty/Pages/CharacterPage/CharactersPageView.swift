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
        ForEach(vm.characterResults.indices, id:\.self){ resultIndex in
          let result = vm.characterResults[resultIndex]
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
          .onAppear{
            vm.reloadMoreData(resultIndex: resultIndex)
          }
        }
        .listRowSeparator(.hidden)
        .listRowBackground(Color("bgColor"))

        if vm.shouldReload() {
          self.LoadingView()
            .frame(width: screenWidth,
                   height: 100,
                   alignment: .center
            )
            .background(Color("bgColor"))
            .offset(x: -20, y: -6)
            .listRowSeparator(.hidden)
        }

      }
      .listStyle(PlainListStyle())
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

  func LoadingView() -> some View {
    return VStack(spacing: 15) {
      ProgressView()
        .progressViewStyle(
          CircularProgressViewStyle(tint: .gray))
        .scaleEffect(2)
      Text("Loading...")
    }
  }
}

struct CharactersView_Previews: PreviewProvider {
  static var previews: some View {
    CharactersPageView(vm: CharacterVM())
  }
}
