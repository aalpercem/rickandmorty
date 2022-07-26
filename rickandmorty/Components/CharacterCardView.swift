//
//  CharacterCardView.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 20.07.2022.
//

import SwiftUI

struct CharacterCardView: View {

  private var title: String = "Title"
  private var descriptionText: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1600s."

  var body: some View {

    VStack(alignment: .leading, spacing: 15) {
      Image(systemName: "globe.europe.africa.fill")
      Text(title).bold()
      Text(descriptionText)
    }
    .padding()
    .background(.green)
    .cornerRadius(10)
    .padding()
    Spacer(minLength: 0)
  }
}

struct CharacterCardView_Previews: PreviewProvider {
  static var previews: some View {
    CharacterCardView()
  }
}
