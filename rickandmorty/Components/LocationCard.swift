//
//  LocationCard.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 31.07.2022.
//

import SwiftUI

struct LocationCard: View {

  //  @State var isPresented = false

  let screenWidth = UIScreen.main.bounds.size.width
  let screenHeight = UIScreen.main.bounds.size.height

  var result: LocationsResult

  var body: some View {

    let name = result.name
    let dimension = result.dimension

    VStack{
      VStack(alignment: .leading, spacing: 5){

        Image("RMEarth")
          .resizable()
          .cornerRadius(15)
          .aspectRatio(contentMode: .fill)
          .clipped()
          .scaledToFill()

        VStack(alignment: .leading){
          Text(name)
            .font(.title)
            .lineLimit(2)
          Spacer(minLength: 5)

          HStack{
            Text(dimension).font(.title3)
            Spacer()
            Image(systemName: "chevron.right")
          }
        }
        .padding()
      }
      .frame(width: screenWidth * 0.8, alignment: .center)
      .frame(maxHeight: screenHeight * 0.4 )
      .background(Color("cardColor"))
      .cornerRadius(15)
      .shadow(color: Color("bgColor"), radius: 5, x: 8, y: 8)
      .padding()
    }
  }
}

struct LocationCard_Previews: PreviewProvider {
  static var previews: some View {
    LocationCard(result: LocationsResult(
      id: "",
      name: "Rick Sanchez",
      dimension: "C-137",
      residents: []
    )
    )
  }
}
