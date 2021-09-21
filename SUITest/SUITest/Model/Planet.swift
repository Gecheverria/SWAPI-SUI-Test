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
    let url: String
}

extension Planet: ItemDisplayable {
    var id: Int? {
        guard let pageURL = URL(string: url) else { return nil }
        
        let components = URLComponents(url: pageURL, resolvingAgainstBaseURL: false)
        
        return Int(components?.queryItems?.first?.value ?? "")
    }
    
    var mainTitle: String {
        name
    }
    
    var subTitle: String? {
        "Pupulation: \(population)"
    }
}
