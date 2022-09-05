//
//  CharacterDetailView.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 17.08.2022.
//

import SwiftUI

struct CharacterDetailView: View {  //Page

  var image: String
  var name: String
  var gender: String
  var status: String
  var originName: String
  var originDimension: String
  //  var deviceHeight = UIScreen.main.bounds.height
  //  var deviceWidth = UIScreen.main.bounds.width

  var body: some View {
    VStack{
      DetailHeaderView(image: image, name: name)
        Form {
          Section("GENDER"){
            Text(gender)
          }
          Section("STATUS"){
            HStack{
              Text(status)
              StatusCircle(status: status)
            }

          }
          Section("ORIGIN"){
            Text(originName)
          }
          Section("DIMENSION"){
            Text(originDimension)
          }

        }
    }
    .background(LinearGradient(gradient: Gradient(colors: [Color("primaryColor"), .white]), startPoint: .top, endPoint: .bottom))
  }
}

//struct CharacterDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//      CharacterDetailView(image:"https://rickandmortyapi.com/api/character/avatar/1.jpeg" )
//    }
//}
