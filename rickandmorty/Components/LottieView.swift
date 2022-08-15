//
//  LottieView.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 15.08.2022.
//

import Lottie
import SwiftUI
import Foundation

struct LottieView: UIViewRepresentable {

  typealias UIViewType = UIView

  var fileName: String

  func makeUIView(context: Context) -> UIView {
    let view = UIView(frame: .zero)

    //Animation
    let animationView = AnimationView()
    animationView.animation = Animation.named(fileName)
    animationView.contentMode = .scaleAspectFit
    animationView.loopMode = .loop
    animationView.play()
    view.addSubview(animationView)

    animationView.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
      animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
    ])

    return view
  }

  func updateUIView(_ uiView: UIView, context: Context) {
    //
  }



}
