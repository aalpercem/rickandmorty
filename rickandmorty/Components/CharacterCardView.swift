//
//  CharacterCardView.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 20.07.2022.
//

import SwiftUI

struct CharacterCardView: View {

  var name: String
  var image: String
  var gender: String
  var status: String
  //   var description: String

  var body: some View {

    VStack(alignment: .leading, spacing: 10) {
      AsyncImage(url: URL(string: image))
        .frame(width: 300, height: 300, alignment: .center)
      VStack(alignment: .leading, spacing: 5){
        Text("Name: \(name)").bold()
        Text("Gender: \(gender)")
          HStack() {
            Text("Status: \(status)")
            Circle()
              .fill(Color.green)
              .frame(width: 10, height: 10, alignment: .leading)
          }
      }.padding()
    }
    .background(.cyan)
    .cornerRadius(10)
    .shadow(color: .gray, radius: 5, x: 8, y: 8)
    .padding()
//    .background(.red)
  }
}

struct CharacterCardView_Previews: PreviewProvider {
  static var previews: some View {
    CharacterCardView(name: "Rick Sanchez", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", gender: "Male", status: "Alive")
  }
}

