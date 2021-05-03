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
}

extension Species: ItemDisplayable {
    var mainTitle: String {
        name
    }
    var subTitle: String? {
        "Classification: \(classification)"
    }
}
