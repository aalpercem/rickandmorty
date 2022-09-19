//
//  CharacterCircle.swift
//  rickandmorty
//
//  Created by Cem Ozturk on 2.09.2022.
//

import SwiftUI

struct CharacterCircle: View {

  var characters: [EpisodeCharacter]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
          HStack(spacing: 5) {
            ForEach(characters, id: \.privateId) { character in
                VStack{
                  AsyncImage(url: URL(string: character.image)){ image in
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
                    Text(character.name)
                      .lineLimit(1)
                    StatusCircle(status: character.status.rawValue)
                  }
                }
                .padding()
                .frame(width: 150, alignment: .center)
            }
          }
        }
    }
}

#if DEBUG
struct CharacterCircle_Previews: PreviewProvider {
    static var previews: some View {
        CharacterCircle(characters: [EpisodeCharacter]())
    }
}
#endif
