import Foundation

struct LocationModel: Codable {
  var data: APILocationsData
}

struct APILocationsData: Codable {
  var locations: Locations
}

struct Locations: Codable {
  var info: LocationsInfo
  var results: [LocationsResult]
}

struct LocationsInfo: Codable {
  var count, pages: Int
  var prev, next: Int?
}

struct LocationsResult: Codable, Identifiable {
  var id: String
  var name: String
  var dimension: String
  var residents: [LocationsResident]
}

struct LocationsResident: Codable, Identifiable {
  var privateId = UUID()
  var id: String
  var name: String
  var image: String
  var status: LocationsStatus
}

enum LocationsStatus: String, Codable {
  case alive = "Alive"
  case dead = "Dead"
  case unknown = "unknown"
}

//

//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}
