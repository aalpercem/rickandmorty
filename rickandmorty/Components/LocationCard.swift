//
//  LocationCardView.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 31.07.2022.
//

import SwiftUI

struct LocationCardView: View {

  @State var isPresented = false

  let screenWidth = UIScreen.main.bounds.size.width
  let screenHeight = UIScreen.main.bounds.size.height

  var name: String
  var dimension: String
  var residents: [LocationsResident]

  var body: some View {
    VStack{
      VStack(alignment: .leading, spacing: 5){

        Image("RMEarth")
          .resizable()
          .cornerRadius(15)
          .aspectRatio(contentMode: .fill)
          .clipped()
          .scaledToFill()

        VStack(alignment: .leading){
          Text(name).font(.title)
          Spacer(minLength: 5)

          HStack{
            Text(dimension).font(.title3)
            Spacer()
            Image(systemName: "chevron.right")
          }
        }
        .padding()

        NavigationLink(
          "",
          destination:
            LocationDetailPage(
              name: name,
              dimension: dimension,
              residents: residents
            ),
          isActive: $isPresented
        ).hidden()
      }
      .onTapGesture {
        isPresented.toggle()
      }
      .frame(width: screenWidth * 0.8)
      //    .frame(idealHeight: screenHeight * 0.1)
      .frame(maxHeight: .infinity)
      .background(Color("cardColor"))
      .cornerRadius(15)
      .shadow(color: .gray, radius: 5, x: 8, y: 8)
      .padding()
    }
  }
}

#if DEBUG
struct LocationCardView_Previews: PreviewProvider {
  static var previews: some View {
    LocationCardView(
      name: "Earth",
      dimension: "C-137",
      residents: []
    )
  }
}
#endif
