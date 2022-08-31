//
//  LocationCardView.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 31.07.2022.
//

import SwiftUI

struct LocationCardView: View {

//  @State var isPresented = false

  let screenWidth = UIScreen.main.bounds.size.width
  let screenHeight = UIScreen.main.bounds.size.height

  var shadowHorizontalOffset = 3.0
  var shadowVerticalOffset = 8.0

  var name: String
  var dimension: String
  var residents: [LocationsResident]

  var body: some View {

    VStack(alignment: .leading, spacing: 5){

        Text(name).font(.title)
        Spacer(minLength: 5)
  //      Text("Residents").font(.title2)
  //      ForEach(residents, id: \.privateId) { resident in
  //        Text("\(resident.name)")
  //      }
        HStack{
          Text(dimension).font(.title3)
          Spacer()
          Image(systemName: "chevron.right")
        }


    }
//    .onTapGesture {
//      isPresented.toggle()
//    }
    .frame(width: screenWidth * 0.8, alignment: .center)
    .frame(idealHeight: screenHeight * 0.1)
    .frame(maxHeight: .infinity)
    .padding()
    .background(Color("primaryColor"))
    .cornerRadius(15)
    .shadow(color: .gray, radius: 5, x: shadowHorizontalOffset, y: shadowVerticalOffset)
    .padding()

//    NavigationLink("", destination: , isActive: $isPresented)
  }
}

struct LocationCardView_Previews: PreviewProvider {
    static var previews: some View {
      LocationCardView(name: "Earth" ,dimension: "C-137" ,residents: [] )
    }
}
