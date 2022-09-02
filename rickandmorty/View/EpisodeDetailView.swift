//
//  EpisodeDetailView.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 2.09.2022.
//

import SwiftUI

struct EpisodeDetailView: View {

  var id: String
  var name: String
  var episodeCode: String
  var airDate: String
  var characters: [EpisodeCharacter]

  var body: some View {
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
    .background(LinearGradient(gradient: Gradient(colors: [Color("primaryColor"), .white]), startPoint: .top, endPoint: .bottom))
  }
}

struct EpisodeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeDetailView(id: "1", name: "Pilot", episodeCode: "S01E01", airDate: "1 Ocak 2022", characters: [])
    }
}
