//
//  rickandmortyApp.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 4.07.2022.
//

import SwiftUI

@main
struct rickandmortyApp: App {

  @StateObject var launchScreenManager = LaunchScreenManager()
//  @StateObject var homeVm = HomeVM()

    var body: some Scene {
        WindowGroup {
          ZStack{
            HomePage()
//            if launchScreenManager.state != .completed {
//              LaunchScreen()
//            }
          }.environmentObject(launchScreenManager)
        }
    }
}
