    //
    //  Quote.swift
    //  TheBreakingOfTheBad
    //
    //  Created by IACD-013 on 2022/06/24.
    //

import Foundation

    // MARK: - CharacterElement
struct QuoteElement: Codable {
    var quote_id : Int
    var quote : String
    var author: String
    var series: String
}

extension QuoteElement{
static let charQuotes: [QuoteElement] = [QuoteElement(quote_id: 01,
                                      quote: "My goal is to make it clap and giggle",
                                      author: "Hektor",
                                      series: "Breaking bad"),
                         QuoteElement(quote_id: 02,
                                      quote: "Theres a snake in my boot and a car insurance offer from budget",
                                      author: "Hektor",
                                      series: "Breaking bad")
    
    ]
}
