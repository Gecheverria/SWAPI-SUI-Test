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
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case director
        case summary = "opening_crawl"
        case episodeNumber = "episode_id"
        case url
    }
}

extension Film: ItemDisplayable {
    var id: Int? {
        guard let pageURL = URL(string: url) else { return nil }
        
        let components = URLComponents(url: pageURL, resolvingAgainstBaseURL: false)
        
        return Int(components?.queryItems?.first?.value ?? "")
    }
    
    var mainTitle: String {
        title
    }
    
    var subTitle: String? {
        nil
    }
}
