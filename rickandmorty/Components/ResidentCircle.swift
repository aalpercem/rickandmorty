//
//  ResidentCircle.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 31.08.2022.
//

import SwiftUI

struct ResidentCircle: View {

  var residents: [LocationsResident]

    var body: some View {

        ScrollView(.horizontal, showsIndicators: false){
          HStack(spacing: 5) {
            ForEach(residents, id: \.privateId) { resident in
                VStack{
                  AsyncImage(url: URL(string: resident.image)){ image in
                    image.resizable()
                  } placeholder: {
                    LottieView(fileName: "circle-loading")
                      .frame(width: 100, height: 100, alignment: .center)
                  }
                  .aspectRatio(contentMode: .fill)
                  .frame(width: 100, height: 100, alignment: .center)
                  .clipShape(Circle())
                  .clipped()
                  .scaledToFill()

                  HStack {
                    Text(resident.name)
                      .lineLimit(1)
                    StatusCircle(status: resident.status.rawValue)
                  }
                }
                .padding()
                .frame(width: 150, alignment: .center)
            }
          }
        }
    }
}

struct ResidentCircle_Previews: PreviewProvider {
    static var previews: some View {
        ResidentCircle(residents: [LocationsResident]())
    }
}
