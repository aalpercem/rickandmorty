// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let characterModel = try? newJSONDecoder().decode(CharacterModel.self, from: jsonData)

import Foundation

typealias CharacterData = GetAllCharactersQuery.Data.Character

struct CharacterModel: Codable {
    var data: DataClass
}

struct DataClass: Codable {
    var characters: Characters
}

struct Characters: Codable {
    var info: Info
    var results: [Result]
}

struct Info: Codable {
    var count: Int
}

struct Result: Codable, Identifiable {
    var id: String
    var image: String
    var name: String
    var gender: Gender?
    var status: Status?
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}

