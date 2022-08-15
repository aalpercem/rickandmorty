//
//  LocationsView.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 31.07.2022.
//

import SwiftUI

struct LocationsView: View {
  @EnvironmentObject var LocationData: LocationsVM

    var body: some View {
      NavigationView {
        ScrollView(.vertical, showsIndicators: false, content: {
          LottieView(fileName: "bored-hand-loading")
            .frame(width: 300, height: 300, alignment: .center)

//         LocationCardView(name: "Earth", dimension: "C-137", residents: ["ASD1","ASD2"])
//          LocationCardView(name: "Earth", dimension: "C-137", residents: ["ASD1","ASD2"])
//          LocationCardView(name: "Earth", dimension: "C-137", residents: ["ASD1","ASD2"])
//          LocationCardView(name: "Earth", dimension: "C-137", residents: ["ASD1","ASD2"])
//          LocationCardView(name: "Earth", dimension: "C-137", residents: ["ASD1","ASD2"])
//          LocationCardView(name: "Earth", dimension: "C-137", residents: ["ASD1","ASD2"])
//          LocationCardView(name: "Earth", dimension: "C-137", residents: ["ASD1","ASD2"])

        })
        .navigationTitle("Locations")
      }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
    }
}
