//
//  LocationsView.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 31.07.2022.
//

import SwiftUI

struct LocationsView: View {

  @ObservedObject var vm: LocationsVM

    var body: some View {
      NavigationView {
        ScrollView(.vertical, showsIndicators: false, content: {
//          LottieView(fileName: "bored-hand-loading")
//            .frame(width: 300, height: 300, alignment: .center)
          VStack{
            ForEach(vm.locationResults){ locationData in
              LocationCardView(
                name: locationData.name,
                dimension: locationData.dimension,
                residents: locationData.residents
              )
    //          .searchable(text: characterData.name))
            }
          }

        })
        .navigationTitle("Locations")
      }
    }
}

#if DEBUG
struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView(vm: LocationsVM())
    }
}
#endif
