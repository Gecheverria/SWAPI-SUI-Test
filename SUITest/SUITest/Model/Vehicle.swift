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
    let url: String
}

extension Vehicle: ItemDisplayable {
    var id: Int? {
        guard let pageURL = URL(string: url) else { return nil }
        
        let components = URLComponents(url: pageURL, resolvingAgainstBaseURL: false)
        
        return Int(components?.queryItems?.first?.value ?? "")
    }
    
    var mainTitle: String {
        name
    }
    
    var subTitle: String? {
        "Model: \(model)"
    }
}
