//
//  CharacterCardView.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 20.07.2022.
//

import SwiftUI

struct CharacterCardView: View {

  @State var isPresented = false

  let deviceHeight = UIScreen.main.bounds.height
  let deviceWidth = UIScreen.main.bounds.width

  var shadowHorizontalOffset = 3.0
  var shadowVerticalOffset = 8.0

  var name: String
  var image: String
  var gender: CharacterGender
  var status: CharacterStatus
  var origin: CharacterOrigin

  var circleColor: Color = .white

  var body: some View {

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
        Text("\(name)").font(.largeTitle)
        Text("\(gender.rawValue)").font(.title3)
        HStack() {
          Text("\(status.rawValue)").font(.title3)
          StatusCircle(status: status.rawValue)
          Spacer()
          Image(systemName: "chevron.right")
        }
      }.padding()

    }
    .onTapGesture {
      isPresented.toggle()
    }
    .frame(width: deviceWidth * 0.8, alignment: .center)
//    .frame(width: deviceWidth * 0.8) // ??? neden burda da var
    .frame(maxHeight: .infinity)
    .background(Color("primaryColor"))
    .cornerRadius(15)
    .shadow(color: .gray, radius: 5, x: shadowHorizontalOffset, y: shadowVerticalOffset)
    .padding(10)

    NavigationLink("", destination: CharacterDetailView(image: image, name: name, gender: gender.rawValue, status: status.rawValue, originName: origin.name.rawValue, originDimension: origin.dimension?.rawValue ?? ""), isActive: $isPresented)
  }

}


#if DEBUG
struct CharacterCardView_Previews: PreviewProvider {
  static var previews: some View {
    CharacterCardView(
      name: "Rick Sanchez",
      image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
      gender: CharacterGender(rawValue: "Male") ?? .unknown,
      status: CharacterStatus(rawValue: "Alive") ?? .unknown,
      origin: CharacterOrigin(id: "123", name: Name(rawValue: "Earth") ?? .unknown)
    )
  }
}
#endif

