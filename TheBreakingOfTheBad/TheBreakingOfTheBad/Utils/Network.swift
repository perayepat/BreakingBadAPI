    //
    //  Network.swift
    //  TheBreakingOfTheBad
    //
    //  Created by IACD-013 on 2022/06/22.
    //

import Foundation
import SwiftUI

    ///making it observable makes the changes show up in the view
class Network: ObservableObject{
        //user model allows us to decode the data
        //and we can call it more easily
    @Published var characters: [CharacterElement] = []
    @Published var quotes: [QuoteElement] = []
     var isFavourited: Bool = false
    
    //use the chracter name to populate the qoutes
//    @Published var characterName : String =
    
    
    func getCharacters() {
            //make sure we have url
        guard let url = URL(string: "https://www.breakingbadapi.com/api/characters") else { fatalError("Missing URL") }
        
        let urlRequest = URLRequest(url: url)
        
            //return the data response and if there is an error return it
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }
                //check for the response
            guard let response = response as? HTTPURLResponse else { return }
            
                //200 means everuthing is ok
            if response.statusCode == 200 {
                guard let data = data else { return }
                    //return to main thread
                DispatchQueue.main.async {
                    do {
                            //decode to users if we have the users
                        let decodedUsers = try JSONDecoder().decode([CharacterElement].self, from: data)
                        self.characters = decodedUsers
                    } catch let error {
                        print("Error decoding: ", error)
                        
                    }
                }
            }
        }
        
        dataTask.resume()
    }
    
    func getQuotes() async throws{
        
    
        guard let url = URL(string: "https://www.breakingbadapi.com/api/quotes") else { fatalError("Missing URL") }
        
        let urlRequest = URLRequest(url: url)
        let (data,response) =  try  await URLSession.shared.data(for: urlRequest)
            //fetch data
        guard (response as? HTTPURLResponse)?.statusCode == 200 else{fatalError("Error while fetching data")}
            //decode
        let decodedQuotes = try JSONDecoder().decode([QuoteElement].self, from: data)
        DispatchQueue.main.async {
            self.quotes = decodedQuotes
        }
    }
}



