// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let aPIEpisodeData = try? newJSONDecoder().decode(APIEpisodeData.self, from: jsonData)

import Foundation

// MARK: - APIEpisodeData
struct EpisodeModel: Codable {
  var data: APIEpisodeData
}

// MARK: - DataClass
struct APIEpisodeData: Codable {
  var episodes: Episodes
}

// MARK: - Episodes
struct Episodes: Codable {
  var info: EpisodeInfo
  var results: [EpisodeResult]
}

// MARK: - EpisodeInfo
struct EpisodeInfo: Codable {
  var count, pages: Int
  var prev, next: Int?
}

// MARK: - EpisodeResult
struct EpisodeResult: Codable, Identifiable {
  var id: String
  var name: EpisodeName
  var episode: EpisodeEnum
  var airDate: String
  var characters: [EpisodeCharacter]

  enum CodingKeys: String, CodingKey {
    case id, name, episode
    case airDate = "air_date"
    case characters
  }
}

// MARK: - Character
struct EpisodeCharacter: Codable, Identifiable {
  var privateId = UUID()
  var id: String
  var image: String
  var name: String
  var status: EpisodeCharacterStatus
}

enum EpisodeEnum: String, Codable {
  case s01E01 = "S01E01"
  case s01E02 = "S01E02"
  case s01E03 = "S01E03"
  case s01E04 = "S01E04"
  case s01E05 = "S01E05"
  case s01E06 = "S01E06"
  case s01E07 = "S01E07"
  case s01E08 = "S01E08"
  case s01E09 = "S01E09"
  case s01E10 = "S01E10"
  case s01E11 = "S01E11"
  case s02E01 = "S02E01"
  case s02E02 = "S02E02"
  case s02E03 = "S02E03"
  case s02E04 = "S02E04"
  case s02E05 = "S02E05"
  case s02E06 = "S02E06"
  case s02E07 = "S02E07"
  case s02E08 = "S02E08"
  case s02E09 = "S02E09"
  case s02E10 = "S02E10"
  case s03E01 = "S03E01"
  case s03E02 = "S03E02"
  case s03E03 = "S03E03"
  case s03E04 = "S03E04"
  case s03E05 = "S03E05"
  case s03E06 = "S03E06"
  case s03E07 = "S03E07"
  case s03E08 = "S03E08"
  case s03E09 = "S03E09"
  case s03E10 = "S03E10"
  case s04E01 = "S04E01"
  case s04E02 = "S04E02"
  case s04E03 = "S04E03"
  case s04E04 = "S04E04"
  case s04E05 = "S04E05"
  case s04E06 = "S04E06"
  case s04E07 = "S04E07"
  case s04E08 = "S04E08"
  case s04E09 = "S04E09"
  case s04E10 = "S04E10"
  case s05E01 = "S05E01"
  case s05E02 = "S05E02"
  case s05E03 = "S05E03"
  case s05E04 = "S05E04"
  case s05E05 = "S05E05"
  case s05E06 = "S05E06"
  case s05E07 = "S05E07"
  case s05E08 = "S05E08"
  case s05E09 = "S05E09"
  case s05E10 = "S05E10"
  case unknown = "unknown"
}

enum EpisodeName: String, Codable {
  case aRickconvenientMort = "A Rickconvenient Mort"
  case aRickleInTime = "A Rickle in Time"
  case amortycanGrickfitti = "Amortycan Grickfitti"
  case anatomyPark = "Anatomy Park"
  case autoEroticAssimilation = "Auto Erotic Assimilation"
  case bigTroubleInLittleSanchez = "Big Trouble in Little Sanchez"
  case childrickOfMort = "Childrick of Mort"
  case clawAndHoarderSpecialRicktimSMorty = "Claw and Hoarder: Special Ricktim's Morty"
  case closeRickCountersOfTheRickKind = "Close Rick-counters of the Rick Kind"
  case edgeOfTomortyRickDieRickpeat = "Edge of Tomorty: Rick, Die, Rickpeat"
  case forgettingSarickMortshall = "Forgetting Sarick Mortshall"
  case getSchwifty = "Get Schwifty"
  case gotronJerrysisRickvangelion = "Gotron Jerrysis Rickvangelion"
  case interdimensionalCable2TemptingFate = "Interdimensional Cable 2: Tempting Fate"
  case lawnmowerDog = "Lawnmower Dog"
  case lookWhoSPurgingNow = "Look Who's Purging Now"
  case mNightShaymAliens = "M. Night Shaym-Aliens!"
  case meeseeksAndDestroy = "Meeseeks and Destroy"
  case mortDinnerRickAndre = "Mort Dinner Rick Andre"
  case mortySMindBlowers = "Morty's Mind Blowers"
  case mortynightRun = "Mortynight Run"
  case mortyplicity = "Mortyplicity"
  case neverRickingMorty = "Never Ricking Morty"
  case oneCrewOverTheCrewcooSMorty = "One Crew Over the Crewcoo's Morty"
  case pickleRick = "Pickle Rick"
  case pilot = "Pilot"
  case promortyus = "Promortyus"
  case raisingGazorpazorp = "Raising Gazorpazorp"
  case rattlestarRicklactica = "Rattlestar Ricklactica"
  case restAndRicklaxation = "Rest and Ricklaxation"
  case rickMortySThanksploitationSpectacular = "Rick & Morty's Thanksploitation Spectacular"
  case rickPotion9 = "Rick Potion #9"
  case rickdependenceSpray = "Rickdependence Spray"
  case rickmancingTheStone = "Rickmancing the Stone"
  case rickmuraiJack = "Rickmurai Jack"
  case ricksyBusiness = "Ricksy Business"
  case rickternalFriendshineOfTheSpotlessMort = "Rickternal Friendshine of the Spotless Mort"
  case rixtyMinutes = "Rixty Minutes"
  case somethingRickedThisWayComes = "Something Ricked This Way Comes"
  case starMortRickturnOfTheJerri = "Star Mort: Rickturn of the Jerri"
  case theABCSOfBeth = "The ABC's of Beth"
  case theOldManAndTheSeat = "The Old Man and the Seat"
  case theRickchurianMortydate = "The Rickchurian Mortydate"
  case theRicklantisMixup = "The Ricklantis Mixup"
  case theRicksMustBeCrazy = "The Ricks Must Be Crazy"
  case theRickshankRickdemption = "The Rickshank Rickdemption"
  case theVatOfAcidEpisode = "The Vat of Acid Episode"
  case theWeddingSquanchers = "The Wedding Squanchers"
  case theWhirlyDirlyConspiracy = "The Whirly Dirly Conspiracy"
  case totalRickall = "Total Rickall"
  case vindicators3TheReturnOfWorldender = "Vindicators 3: The Return of Worldender"
  case unknown = "unknown"
}

enum EpisodeCharacterLocationDimension: String, Codable {
  case chairDimension = "Chair Dimension"
  case cromulonDimension = "Cromulon Dimension"
  case dimensionC137 = "Dimension C-137"
  case dimensionC500A = "Dimension C-500A"
  case empty = ""
  case evilRickSTargetDimension = "Evil Rick's Target Dimension"
  case fantasyDimension = "Fantasy Dimension"
  case fascistDimension = "Fascist Dimension"
  case giantTelepathicSpidersDimension = "Giant Telepathic Spiders Dimension"
  case phoneDimension = "Phone Dimension"
  case pizzaDimension = "Pizza Dimension"
  case replacementDimension = "Replacement Dimension"
  case testicleMonsterDimension = "Testicle Monster Dimension"
  case unknown = "unknown"
}

enum EpisodeCharacterStatus: String, Codable {
  case alive = "Alive"
  case dead = "Dead"
  case unknown = "unknown"
}
