//
//  LocationsPageView.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 31.07.2022.
//

import SwiftUI

struct LocationsPageView: View {

  @ObservedObject var vm: LocationVM

  var body: some View {
    NavigationView {
      List {
        ForEach(vm.locationResults){ result in
          ZStack{
            LocationCard(result: result)
            NavigationLink(destination: LocationDetailPage(result: result))
            {
              EmptyView()
            }
            .opacity(0.0)
            .buttonStyle(PlainButtonStyle())
          }
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
        UITableView.appearance().showsVerticalScrollIndicator = false
      }
      .navigationTitle("Locations")
    }
  }
}

#if DEBUG
struct LocationsView_Previews: PreviewProvider {
  static var previews: some View {
    LocationsPageView(vm: LocationVM())
  }
}
#endif
