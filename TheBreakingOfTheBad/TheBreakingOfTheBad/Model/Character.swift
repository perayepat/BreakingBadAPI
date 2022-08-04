    // This file was generated from JSON Schema using quicktype, do not modify it directly.
    // To parse the JSON, add this file to your project and do:
    //
    //   let character = try? newJSONDecoder().decode(Character.self, from: jsonData)

import Foundation


    // MARK: - CharacterElement
struct CharacterElement: Decodable {
    var char_id: Int?
    var name: String?
    var occupation: [String]?
    var img: String?
    var status: String?
    var nickname: String?
    var portrayed: String?
    var better_call_saul_appearance: [Int?]
    
}

extension CharacterElement {
    
     static let tempCharacter  =  CharacterElement(char_id: 01,
                                           name: "Hektor",
                                           occupation:["Singer", "Stripper"],
                                           img: "https://thumbs.dreamstime.com/b/smiling-old-man-having-coffee-portrait-looking-happy-33471677.jpg",
                                           status: "Meme",
                                           nickname: "Internet Historian",
                                           portrayed: "Incognito Mode",
                                        better_call_saul_appearance: [0,0,2,1])
    
}





