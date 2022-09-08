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
          ForEach(vm.locationResults){ locationData in
            LocationCardView(
              name: locationData.name,
              dimension: locationData.dimension,
              residents: locationData.residents
            )
  //          .searchable(text: characterData.name))
          }
          .listRowSeparator(.hidden)
          .listRowBackground(LinearGradient(gradient: Gradient(colors: [.white, Color("bgColor"), .white]), startPoint: .top, endPoint: .bottom))
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
