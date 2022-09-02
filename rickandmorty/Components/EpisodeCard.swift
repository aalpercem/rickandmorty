//
//  EpisodeCard.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 2.09.2022.
//

import SwiftUI

struct EpisodeCard: View {
  
  @State var isPresented = false
  
  let screenWidth = UIScreen.main.bounds.size.width
  let screenHeight = UIScreen.main.bounds.size.height
  
  var id: String
  var name: String
  var episodeCode: String
  var airDate: String
  var characters: [EpisodeCharacter]
  
  var body: some View {
//    VStack {
      VStack (alignment: .leading, spacing: 5) {
        Text(name).font(.title)
        Spacer()
        Text(episodeCode)
            HStack {
              Text(airDate)
              Spacer()
              Image(systemName: "chevron.right")
            }
          }
          .padding()
//  }
    .frame(width: screenWidth * 0.9)
    .frame(maxHeight: .infinity)
    .background(Color("primaryColor"))
    .cornerRadius(15)
    .shadow(color: .gray, radius: 5, x: 8, y: 8)
    .padding()

//    NavigationLink(
//      "",
//      destination:
//
//
//      isActive: $isPresented
//    )
}
  //
  //struct EpisodeCard_Previews: PreviewProvider {
  //    static var previews: some View {
  //        EpisodeCard()
  //    }
  //}

}
