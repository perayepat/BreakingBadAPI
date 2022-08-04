//
//  EpisodesModel.swift
//  TheBreakingOfTheBad
//
//  Created by IACD-013 on 2022/08/04.
//

import Foundation

struct EpisodeElement:Decodable{
    var episode_id: Int?
    var title: String?
    var season: String?
    var air_date: String?
    var characters: [String]?
    var episode: String?
    var series: String?
}

extension EpisodeElement{
    static let emptyEpisode = EpisodeElement(episode_id: 1, title: "", season: "", air_date: "", characters: ["",""], episode: "", series: "")
    static let tempEpisode = EpisodeElement(episode_id: 1, title: "The start", season: "season 1", air_date: "27 april", characters: ["Hektor", "Lil B"], episode: "1", series: "Breaking bad")
}
