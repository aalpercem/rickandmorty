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
        ForEach(vm.locationResults.indices, id:\.self){ resultIndex in
          let result = vm.locationResults[resultIndex]
          ZStack{
            LocationCard(result: result)
            NavigationLink(destination: LocationDetailPage(result: result))
            {
              EmptyView()
            }
            .opacity(0.0)
            .buttonStyle(PlainButtonStyle())
          }
          .onAppear{
            vm.reloadMoreData(resultIndex: resultIndex)
          }
        }
        .listRowSeparator(.hidden)
        .listRowBackground(Color("bgColor"))

        if vm.shouldReload() {
          self.LoadingView()
            .frame(width: screenWidth,
                   height: 100,
                   alignment: .center
            )
            .background(Color("bgColor"))
            .listRowInsets(EdgeInsets())
            .listRowSeparator(.hidden)
        }
      }
      .listStyle(PlainListStyle())
      .onAppear{
        UITableView.appearance().showsVerticalScrollIndicator = false
      }
      .navigationTitle("Locations")
    }
  }
  
  func LoadingView() -> some View {
    return VStack(spacing: 15) {
      ProgressView()
        .progressViewStyle(
          CircularProgressViewStyle(tint: .gray))
        .scaleEffect(2)
      Text("Loading...")
    }
  }
}

struct LocationsView_Previews: PreviewProvider {
  static var previews: some View {
    LocationsPageView(vm: LocationVM())
  }
}
