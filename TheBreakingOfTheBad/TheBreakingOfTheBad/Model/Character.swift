    // This file was generated from JSON Schema using quicktype, do not modify it directly.
    // To parse the JSON, add this file to your project and do:
    //
    //   let character = try? newJSONDecoder().decode(Character.self, from: jsonData)

import Foundation

    // MARK: - CharacterElement
struct CharacterElement: Decodable {
    var char_id: Int
    var name: String
    var occupation: [String]
    var img: String
    var status: String
    var nickname: String
    var portrayed: String
}





