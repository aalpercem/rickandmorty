//
//  LocationVM.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 31.07.2022.
//

import SwiftUI

class LocationVM: ObservableObject {

  @Published var locationResults: [LocationsResult] = []
  @Published var currentPage: Int = 1

  var totalPage: Int? = nil

  init(){
    fetchLocations(page: currentPage)
  }

  func fetchLocations(page: Int){

    print("Getting Locations: \(page)")

    Network.shared.apollo.fetch(query: GetAllLocationsQuery(page: page)) { result in
      switch result {
      case let .success(response):
        print("Success! Result:\(response)")
        if let locations = response.data?.locations{

            self.totalPage = locations.info?.pages

            locations.results?.forEach { item in
              
              if let item = item {
                var residents: [LocationsResident] = []

                for resident in item.residents {
                  residents.append(
                    LocationsResident(
                      id: resident?.id ?? "",
                      name: resident?.name ?? "",
                      image: resident?.image ?? "",
                      status: LocationsStatus(rawValue: (resident?.status)!) ?? .unknown)
                  )
                }
                let locationResult = LocationsResult(
                  id: item.id ?? "",
                  name: item.name ?? "",
                  dimension: item.dimension ?? "",
                  residents: residents
                )
                self.locationResults.append(locationResult)
              }
            }
          //TODO: Trigger event for change currentPage (Event new page requested)
            self.currentPage += 1

        }
      case .failure(let error):
        print("Failure!! Error: \(error)")
      }
    }
  }

  //MARK: Infinite scrolling
  func reloadMoreData (resultIndex: Int) {
    if resultIndex == locationResults.count - 1{
      guard currentPage - 1 != totalPage else {
        return
      }
      fetchLocations(page: currentPage)
    }
  }

  func shouldReload () -> Bool{
    guard currentPage - 1 != totalPage else {
      return false
    }
    return true
  }
}
