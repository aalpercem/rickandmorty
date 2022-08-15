//
//  CharacterCardView.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 20.07.2022.
//

import SwiftUI

struct CharacterCardView: View {

  var deviceHeight = UIScreen.main.bounds.height
  var deviceWidth = UIScreen.main.bounds.width

  var shadowHorizontalOffset = 3.0
  var shadowVerticalOffset = 8.0

  var name: String
  var image: String
  var gender: CharacterGender
  var status: CharacterStatus
  var origin: CharacterOrigin

  var body: some View {

    VStack(alignment: .leading, spacing: 10) {
      AsyncImage(url: URL(string: image)){ image in
        image.resizable()
      } placeholder: {
        LottieView(fileName: "loading")
          .frame(width: 200, height: 200, alignment: .center)
          .background(Color.red)
      }
      .frame(width: deviceWidth * 0.8)
      .frame(maxHeight: .infinity)
      .scaledToFill()

      VStack(alignment: .leading, spacing: 5){
        Text("\(name)").font(.largeTitle)
        Text("\(gender.rawValue)").font(.title3)
        //TODO: Origin & Dimension detail sayfada olsun.
        //        Text("Origin: \(origin.name.rawValue)")
        //        Text("Dimension: \(origin.dimension?.rawValue ?? "")")
        HStack() {
          Text("\(status.rawValue)").font(.title3)
          Circle()
            .fill(Color.green)
            .frame(width: 10, height: 10, alignment: .leading)
          Spacer()
          Image(systemName: "chevron.right")
          //TODO: Fix Alignment
        }
      }.padding()
    }
    .frame(width: deviceWidth * 0.8, alignment: .center)
    .frame(width: deviceWidth * 0.8)
    .frame(maxHeight: .infinity)
    .background(.mint)
    .cornerRadius(15)
    .shadow(color: .gray, radius: 5, x: shadowHorizontalOffset, y: shadowVerticalOffset)
    .padding(10)
  }
}

//struct CharacterCardView_Previews: PreviewProvider {
//  static var previews: some View {
//    CharacterCardView(name: "Rick Sanchez", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", gender: "Male", status: "Alive", origin: "Earth")
//  }
//}
//
