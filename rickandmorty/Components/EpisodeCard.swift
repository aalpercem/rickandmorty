//
//  EpisodeCard.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 2.09.2022.
//

import SwiftUI

struct EpisodeCard: View {
  
  let screenWidth = UIScreen.main.bounds.size.width
  let screenHeight = UIScreen.main.bounds.size.height
  
  var result: EpisodeResult
  
  var body: some View {

    let name = result.name.rawValue
    let episodeCode = result.episode.rawValue
    let airDate = result.airDate

    VStack(alignment: .leading, spacing: 5) {

      Image("RMEpisode")
        .resizable()
        .cornerRadius(15)
        .aspectRatio(contentMode: .fill)
        .clipped()
        .scaledToFill()

      VStack (alignment: .leading, spacing: 5) {
        Text(name)
          .font(.title)
          .lineLimit(2)
        Spacer()
        Text(episodeCode)
        HStack {
          Text(airDate)
          Spacer()
          Image(systemName: "chevron.right")
        }
      }
      .padding()
    }
    .frame(width: screenWidth * 0.9)
    .frame(maxHeight: screenHeight * 0.4)
    .background(Color("cardColor"))
    .cornerRadius(15)
    .shadow(color: Color("bgColor"), radius: 5, x: 8, y: 8)
    .padding()
    
  }
}

struct EpisodeCard_Previews: PreviewProvider {
  static var previews: some View {
    EpisodeCard(
      result: EpisodeResult(
        id: "",
        name: .pilot,
        episode: .s01E01,
        airDate: "October 21, 2022",
        characters: []
      )
    )
  }
}
