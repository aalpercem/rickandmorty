//
//  LocationDetailView.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 31.08.2022.
//

import SwiftUI

struct LocationDetailView: View {

  var name: String
  var dimension: String
  var residents: [LocationsResident]


  var body: some View {
      VStack{
        VStack{
          Image("RMEarth")
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(width: 200, height: 200, alignment: .center)
          .clipShape(Circle())
          .clipped()
          .scaledToFill()
          Text(name).font(.largeTitle)
        }

        Form {
          Section("NAME"){
            Text(name)
          }
          Section("DIMENSION"){
            Text(dimension)
          }
          Text("Residents")
          ResidentCircle(residents: residents)
        }
      }
      .background(LinearGradient(gradient: Gradient(colors: [Color("primaryColor"), .white]), startPoint: .top, endPoint: .bottom))
//      .navigationTitle(name)

  }
}

//struct LocationDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        LocationDetailView()
//    }
//}
