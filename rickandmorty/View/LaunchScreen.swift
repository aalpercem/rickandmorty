//
//  LaunchScreen.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 8.09.2022.
//

import SwiftUI

struct LaunchScreen: View {

  var body: some View {
    VStack{
      LottieView(
        fileName: "bored-hand-loading",
        loopMode: .repeat(3)
      )
    }
    .background(Color("primaryColor"))
  }
}

struct LaunchScreen_Previews: PreviewProvider {
  static var previews: some View {
    LaunchScreen()
  }
}
