//
//  Vehicle.swift
//  SUITest
//
//  Created by Gabriel Echeverria on 3/21/21.
//

import Foundation

struct Vehicle: Decodable {
    let name: String
    let model: String
    let passengers: String
    let consumables: String
    let crew: String
}

extension Vehicle: ItemDisplayable {
    var mainTitle: String {
        name
    }
    
    var subTitle: String? {
        "Model: \(model)"
    }
}
