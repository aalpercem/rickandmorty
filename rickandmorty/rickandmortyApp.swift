//
//  rickandmortyApp.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 4.07.2022.
//

import SwiftUI

@main
struct rickandmortyApp: App {

  //MARK: This structure was for Lottie Splash Screen - May be added in the future

//  @StateObject var launchScreenManager = LaunchScreenManager()

    var body: some Scene {
        WindowGroup {
//          ZStack{
            LaunchScreen()
//            HomePage()
            // counter
//            if launchScreenManager.state != .completed {
//              LaunchScreen()
//            }
//          }.environmentObject(launchScreenManager)
        }
    }
}
