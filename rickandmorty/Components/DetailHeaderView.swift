//
//  DetailHeaderView.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 17.08.2022.
//

import SwiftUI

struct DetailHeaderView: View {

  var image: String
  var name: String

    var body: some View {

        AsyncImage(url: URL(string: image)){ image in
          image.resizable()
        } placeholder: {
          LottieView(fileName: "circle-loading")
            .frame(width: 300, height: 300, alignment: .center)
        }
        .aspectRatio(contentMode: .fill)
        .frame(width: 200, height: 200, alignment: .center)
        .clipShape(Circle())
        .clipped()
        .scaledToFill()

        Text(name).font(.largeTitle)

    }
}

//struct DetailHeaderView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailHeaderView()
//    }
//}
