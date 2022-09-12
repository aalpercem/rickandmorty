//
//  LocationsView.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 31.07.2022.
//

import SwiftUI

struct LocationsView: View {

  @ObservedObject var vm: LocationVM
  @State var isPulled: Bool = false

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
          isPulled.toggle()
          vm.refreshLocationData(isPulled: isPulled)
          isPulled.toggle()
        }
        .onAppear{
          //FIXME: Only Hides
          UITableView.appearance().showsVerticalScrollIndicator = false
        }
//        .background(Color("bgColor"))
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
