//
//  StarShip.swift
//  SUITest
//
//  Created by Gabriel Echeverria on 3/21/21.
//

import Foundation

struct StarShip: Decodable {
    let name: String
    let model: String
    let passengers: String
    let consumables: String
    let crew: String
    let hyperdriveRating: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case model
        case passengers
        case consumables
        case crew
        case hyperdriveRating = "hyperdrive_rating"
    }
}

extension StarShip: ItemDisplayable {
    var mainTitle: String {
        name
    }
    
    var subTitle: String? {
        "Hyperdrive rating: \(hyperdriveRating)"
    }
}
