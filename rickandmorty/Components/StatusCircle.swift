//
//  StatusCircle.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 22.08.2022.
//

import SwiftUI

struct StatusCircle: View {

  var status: String

    var body: some View {
      VStack{
        Circle()
          .fill(
            status == "Alive" ? .green : status == "Dead" ? .red : .blue
          )
          .frame(width: 10, height: 10, alignment: .leading)
      }
    }
}

struct StatusCircle_Previews: PreviewProvider {
    static var previews: some View {
      StatusCircle(status: "Alive")
    }
}
