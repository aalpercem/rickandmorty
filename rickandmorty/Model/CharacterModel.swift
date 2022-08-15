import Foundation

// MARK: - CharacterModel
struct CharacterModel: Codable {
  var data: APICharacterData
}

// MARK: - DataClass
struct APICharacterData: Codable {
  var characters: Characters
}

// MARK: - Characters
struct Characters: Codable {
  var info: CharacterInfo
  var results: [CharacterResult]
}

// MARK: - Characters -> Info
struct CharacterInfo: Codable {
  var count, pages: Int
  var prev, next: Int? //JSONull, NSNull
}

// MARK: - Characters -> CharacterResult
struct CharacterResult: Codable, Identifiable {
  var id: String
  var image: String
  var name: String
  var gender: CharacterGender
  var status: CharacterStatus
  var origin: CharacterOrigin
}

//MARK: - CharacterResult -> Gender
enum CharacterGender: String, Codable {
  case female = "Female"
  case male = "Male"
  case unknown = "unknown"
}

//MARK: - CharacterResult -> Status
enum CharacterStatus: String, Codable {
  case alive = "Alive"
  case dead = "Dead"
  case unknown = "unknown"
}

// MARK: - CharacterResult -> Origin
struct CharacterOrigin: Codable, Identifiable {
  var id: String
  var name: Name
  var dimension: Dimension?
}

//MARK: - Origin -> Dimension
enum Dimension: String, Codable {
  case dimensionC137 = "Dimension C-137"
  case replacementDimension = "Replacement Dimension"
  case unknown = "unknown"
}

//MARK: - Origin -> Name
enum Name: String, Codable {
  case abadango = "Abadango"
  case earthC137 = "Earth (C-137)"
  case earthReplacementDimension = "Earth (Replacement Dimension)"
  case unknown = "unknown"
}

//
//// MARK: - Encode/decode helpers
//
//class JSONNull: Codable, Hashable {
//
//  public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//    return true
//  }
//
//  public var hashValue: Int {
//    return 0
//  }
//
//  public init() {}
//
//  public required init(from decoder: Decoder) throws {
//    let container = try decoder.singleValueContainer()
//    if !container.decodeNil() {
//      throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//    }
//  }
//
//  public func encode(to encoder: Encoder) throws {
//    var container = encoder.singleValueContainer()
//    try container.encodeNil()
//  }
//}
//
