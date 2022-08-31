//
//  LocationCardView.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 31.07.2022.
//

import SwiftUI

struct LocationCardView: View {

  let screenWidth = UIScreen.main.bounds.size.width
  let screenHeight = UIScreen.main.bounds.size.height

  var name: String
  var dimension: String
  var residents: [LocationsResident]

  var body: some View {
    VStack(alignment: .leading, spacing: 10){
      Text("Name: \(name)").bold()
      HStack{
        Text("Dimension: \(dimension)")
        Spacer()
        Image(systemName: "chevron.right")
      }

      ForEach(residents, id: \.privateId) { resident in
        Text("Resident Name: \(resident.name)")
      }


    }
    .frame(width: screenWidth * 0.8, alignment: .center)
    .frame(maxHeight: .infinity)
//    .padding()
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
