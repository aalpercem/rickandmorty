//
//  LaunchScreenManager.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 8.09.2022.
//

import Foundation

enum LaunchScreenPhase {
  case start
  case completed
}

final class LaunchScreenManager: ObservableObject {

  @Published private(set) var state: LaunchScreenPhase = .start

  func dismiss(){
    self.state = .completed
  }
}
