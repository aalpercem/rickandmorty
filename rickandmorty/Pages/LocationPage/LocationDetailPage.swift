//
//  LocationDetailPage.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 31.08.2022.
//

import SwiftUI

struct LocationDetailPage: View {

  var result: LocationsResult

  var body: some View {

    let name = result.name
    let dimension = result.dimension
    let residents = result.residents

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
      .background(
        LinearGradient(
          gradient: Gradient(colors: [Color("bgColor"), .white]),
          startPoint: .top,
          endPoint: .bottom
        )
      )
  }
}

#if DEBUG
struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
      LocationDetailPage(result: LocationsResult(
        id: "",
        name: "Rick Sanchez",
        dimension: "C-137",
        residents: []
      )
      )
    }
}
#endif
