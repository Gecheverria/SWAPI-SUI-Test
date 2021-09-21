//
//  DualDetailDisplayablerotocol.swift
//  SUITest
//
//  Created by Gabriel Echeverria on 6/6/21.
//

import Foundation

struct DualDetailDisplayable: Identifiable {
    var id: String {
        title.appending(description)
    }
    let title: String
    let description: String
}
