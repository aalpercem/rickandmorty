//
//  LaunchScreen.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 8.09.2022.
//

import SwiftUI

struct LaunchScreen: View {

  @EnvironmentObject var launchScreenManager: LaunchScreenManager

  var body: some View {
    VStack(alignment: .center, spacing: 0){
      LottieView(
        fileName: "rocket-loader",
        loopMode: .loop
      )
    }
    .background(Color("primaryColor"))
  }
}

struct LaunchScreen_Previews: PreviewProvider {
  static var previews: some View {
    LaunchScreen().environmentObject(LaunchScreenManager())
  }
}
