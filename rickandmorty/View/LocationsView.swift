//
//  LocationsView.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 31.07.2022.
//

import SwiftUI

struct LocationsView: View {

  @ObservedObject var vm: LocationsVM
  @State var isPulled: Bool = false

    var body: some View {
      NavigationView {
        List {
          ForEach(vm.locationResults){ locationData in
            LocationCardView(
              name: locationData.name,
              dimension: locationData.dimension,
              residents: locationData.residents
            )
  //          .searchable(text: characterData.name))
          }
          .listRowSeparator(.hidden)
        }
        .listStyle(PlainListStyle())
        .refreshable {
          isPulled.toggle()
          vm.refreshLocationData(isPull: isPulled)
          isPulled.toggle()
        }
        .onAppear{
          //FIXME: Only Hides
          UITableView.appearance().showsVerticalScrollIndicator = false
        }
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
