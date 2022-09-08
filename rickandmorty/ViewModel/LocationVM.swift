//
//  LocationViewModel.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 31.07.2022.
//

import SwiftUI

class LocationsVM: ObservableObject {

  @Published var locationResults: [LocationsResult] = []

  let emptyResult: [LocationsResult] = []

  var currentPage = 1
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
          DispatchQueue.main.async {
            self.totalPage = locations.info?.pages
            let _: [LocationsResult] = locations.results?.map { item in
              var locationResult = LocationsResult(id: "", name: "", dimension: "", residents: [])
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
                locationResult = LocationsResult(id: item.id ?? "", name: item.name ?? "", dimension: item.dimension ?? "", residents: residents)
              }
              self.locationResults.append(locationResult)
              return locationResult

            } ?? self.emptyResult
            self.currentPage += 1
          }
        }
      case .failure(let error):
        print("Failure!! Error: \(error)")
      }
    }
  }

  func refreshLocationData(isPulled: Bool) {
    guard isPulled && currentPage - 1 != totalPage else {
      return
    }
    fetchLocations(page: currentPage)
  }

}

