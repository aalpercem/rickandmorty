//
//  rickandmortyApp.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 4.07.2022.
//

import SwiftUI

@main
struct rickandmortyApp: App {

  @StateObject var homeViewModel = HomeVM()

    var body: some Scene {
        WindowGroup {
            ContentView()
            .environmentObject(homeViewModel)
        }
    }
}
