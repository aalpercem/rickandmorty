//
//  EpisodeDetailPage.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 2.09.2022.
//

import SwiftUI

struct EpisodeDetailPage: View {

  var result:  EpisodeResult

  var body: some View {

    let name = result.name.rawValue
    let episodeCode = result.episode.rawValue
    let airDate = result.airDate
    let characters = result.characters

    VStack{
      VStack{
        Image("RMEpisode")
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(width: 200, height: 200, alignment: .center)
          .clipShape(Circle())
          .clipped()
          .scaledToFill()
        Text(name).font(.largeTitle)
      }

      Form {
        Section("EPISODE INFO"){
          HStack{
            Text(name)
            Spacer()
            Text(episodeCode)
          }
        }
        Section("AIR DATE"){
          Text(airDate)
        }
        Text("Characters In The Episode")
        CharacterCircle(characters: characters)

      }
    }
    .background(
      LinearGradient(
        gradient: Gradient(colors: [Color("bgColor"), .white]),
        startPoint: .top,
        endPoint: .bottom
      )
    )
  }
}

struct EpisodeDetailView_Previews: PreviewProvider {
    static var previews: some View {
      EpisodeDetailPage(
        result: EpisodeResult(
          id: "",
          name: .pilot,
          episode: .s01E01,
          airDate: "January 1, 2022",
          characters: []
        )
      )
    }
}
