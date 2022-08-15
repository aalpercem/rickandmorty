//
//  LocationCardView.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 31.07.2022.
//

import SwiftUI

struct LocationCardView: View {

  static let screenWidth = UIScreen.main.bounds.size.width
  static let screenHeight = UIScreen.main.bounds.size.height

  var name: String
  var dimension: String
  var residents: [String]

  var body: some View {
    VStack(alignment: .leading, spacing: 10){
      Text("Name: Earth").bold()
      HStack{
        Text("Dimension: C-137")
        Spacer()
        Image(systemName: "chevron.right")
      }

    }
    .frame(width: LocationCardView.screenWidth*0.8 , height: 65, alignment: .leading)
    .padding()
    .background(.green)
    .cornerRadius(15)
    .shadow(color: .gray, radius: 5, x: 8, y: 8)
    .padding()


  }
}

//struct LocationCardView_Previews: PreviewProvider {
//    static var previews: some View {
//      let emptyString: [String] = []
//      LocationCardView(name: "Earth" ,dimension: "C-137" ,residents: emptyString )
//    }
//}
