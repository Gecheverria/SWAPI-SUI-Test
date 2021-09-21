//
//  Species.swift
//  SUITest
//
//  Created by Gabriel Echeverria on 3/21/21.
//

import Foundation

struct Species: Decodable {
    let name: String
    let language: String
    let designation: String
    let classification: String
    let url: String
}

extension Species: ItemDisplayable {
    var id: Int? {
        guard let pageURL = URL(string: url) else { return nil }
        
        let components = URLComponents(url: pageURL, resolvingAgainstBaseURL: false)
        
        return Int(components?.queryItems?.first?.value ?? "")
    }
    
    var mainTitle: String {
        name
    }
    var subTitle: String? {
        "Classification: \(classification)"
    }
}
