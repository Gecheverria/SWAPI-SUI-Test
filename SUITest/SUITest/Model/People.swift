//
//  People.swift
//  SUITest
//
//  Created by Gabriel Echeverria on 3/21/21.
//

import Foundation

struct People: Decodable {
    let name: String
    let height: String
    let mass: String
    let hairColor: String
    let skinColor: String
    let eyeColor: String
    let birthYear: String
    let gender: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case height
        case mass
        case hairColor = "hair_color"
        case skinColor = "skin_color"
        case eyeColor = "eye_color"
        case birthYear = "birth_year"
        case gender
        case url
    }
}

extension People: ItemDisplayable {
    var id: Int? {
        guard let pageURL = URL(string: url) else { return nil }
        
        let components = URLComponents(url: pageURL, resolvingAgainstBaseURL: false)
        
        return Int(components?.queryItems?.first?.value ?? "")
    }
    
    var mainTitle: String {
        name
    }
    
    var subTitle: String? {
        nil
    }
}
