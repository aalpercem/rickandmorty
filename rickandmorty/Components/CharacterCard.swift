//
//  CharacterCard.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 20.07.2022.
//

import SwiftUI

struct CharacterCard: View {

  let deviceHeight = UIScreen.main.bounds.height
  let deviceWidth = UIScreen.main.bounds.width

  var shadowHorizontalOffset = 3.0
  var shadowVerticalOffset = 8.0

  var result: CharacterResult

  var body: some View {

    let image = result.image
    let name = result.name
    let gender = result.gender.rawValue
    let status = result.status.rawValue

    VStack(alignment: .leading, spacing: 10) {
      AsyncImage(url: URL(string: image)){ image in
        image.resizable()
      } placeholder: {
        LottieView(fileName: "circle-loading")
          .frame(width: 300, height: 300, alignment: .center)
      }
      .frame(width: deviceWidth * 0.8)
      .frame(maxHeight: .infinity)
      .scaledToFill()

      VStack(alignment: .leading, spacing: 5){
        Text(name)
          .font(.largeTitle)
        Text(gender)
          .font(.title3)
        HStack() {
          Text(status)
            .font(.title3)
          StatusCircle(status: status)
          Spacer()
          Image(systemName: "chevron.right")
        }
      }.padding()
    }
    .frame(width: deviceWidth * 0.8, alignment: .center)
    .frame(maxHeight: .infinity)
    .background(Color("cardColor"))
    .cornerRadius(15)
    .shadow(color: Color("bgColor"),
            radius: 5,
            x: shadowHorizontalOffset,
            y: shadowVerticalOffset
    )
    .padding(10)
  }
}

#if DEBUG
struct CharacterCard_Previews: PreviewProvider {
  static var previews: some View {
    CharacterCard(result: CharacterResult(
      id: "",
      image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
      name: "Rick Sanchez",
      gender: .male,
      status: .alive,
      origin: CharacterOrigin(
        id: "",
        name: .earthC137,
        dimension: .dimensionC137
      )
    )
    )
  }
}
#endif

