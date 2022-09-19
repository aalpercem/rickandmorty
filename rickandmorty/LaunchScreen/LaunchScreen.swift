//
//  LaunchScreen.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 8.09.2022.
//

import SwiftUI

struct LaunchScreen: View {

  @State private var isActive = false

  var body: some View {

    if isActive {
      HomePage()
    } else {
      VStack(alignment: .center, spacing: 0){
        LottieView(
          fileName: "rocket-loader",
          loopMode: .loop
        )
      }
      .background(Color("bgColor"))
      .onAppear{
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0){
          self.isActive = true
        }
      }
    }
  }
}

struct LaunchScreen_Previews: PreviewProvider {
  static var previews: some View {
    LaunchScreen()
  }
}
