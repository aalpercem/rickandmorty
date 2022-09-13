//
//  LocationsView.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 31.07.2022.
//

import SwiftUI

struct LocationsView: View {

  @ObservedObject var vm: LocationVM

    var body: some View {
      NavigationView {
        List {
          ForEach(vm.locationResults){ result in
            LocationCardView(
              name: result.name,
              dimension: result.dimension,
              residents: result.residents
            )
          }
          .listRowSeparator(.hidden)
          .listRowBackground(Color("bgColor"))
        }
        .listStyle(PlainListStyle())
        .refreshable {
          vm.isPulled = true
          vm.refreshLocationData()

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
        LocationsView(vm: LocationVM())
    }
}
#endif
