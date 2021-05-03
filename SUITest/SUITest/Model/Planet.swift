//
//  Planet.swift
//  SUITest
//
//  Created by Gabriel Echeverria on 3/21/21.
//

import Foundation

struct Planet: Decodable {
    let name: String
    let gravity: String
    let climate: String
    let diameter: String
    let population: String
}

extension Planet: ItemDisplayable {
    var mainTitle: String {
        name
    }
    
    var subTitle: String? {
        "Pupulation: \(population)"
    }
}
