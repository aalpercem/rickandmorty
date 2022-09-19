//
//  CharacterDetailPage.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 17.08.2022.
//

import SwiftUI

struct CharacterDetailPage: View {

  var result: CharacterResult

  var body: some View {
    VStack{
      DetailHeaderView(
        image: result.image,
        name: result.name
      )
      Form {
        Section("GENDER"){
          Text(result.gender.rawValue)
        }
        Section("STATUS"){
          HStack{
            Text(result.status.rawValue)
            StatusCircle(status: result.status.rawValue)
          }
        }
        Section("ORIGIN"){
          Text(result.origin.name.rawValue)
        }
        Section("DIMENSION"){
          Text(result.origin.dimension?.rawValue ?? "")
        }
      }
    }
    .background(
      LinearGradient(
        gradient: Gradient(colors: [ Color("bgColor"), .white]),
        startPoint: .top,
        endPoint: .bottom
      )
    )
  }
}

struct CharacterDetailView_Previews: PreviewProvider {
  static var previews: some View {
    CharacterDetailPage(result: CharacterResult(
      id: "nil",
      image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
      name: "Rick Sanchez",
      gender:  .male,
      status: .alive,
      origin: CharacterOrigin(
        id: "nil",
        name: .earthC137,
        dimension: .dimensionC137
      )
      )
    )
  }
}
