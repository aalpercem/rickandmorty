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


    ScrollView(.vertical, showsIndicators: false, content: {
      
    })

  }


}

struct CharactersView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
