//
//  Film.swift
//  SUITest
//
//  Created by Gabriel Echeverria on 3/21/21.
//

import Foundation

struct Film: Decodable {
    let title: String
    let director: String
    let summary: String
    let episodeNumber: Int
    
    enum CodingKeys: String, CodingKey {
        case title
        case director
        case summary = "opening_crawl"
        case episodeNumber = "episode_id"
    }
}

extension Film: ItemDisplayable {
    var mainTitle: String {
        title
    }
    
    var subTitle: String? {
        nil
    }
}
