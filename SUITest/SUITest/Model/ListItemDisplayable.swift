//
//  ListItemDisplayable.swift
//  SUITest
//
//  Created by Gabriel Echeverria on 20/9/21.
//

import Foundation

struct ListItemDisplayable: Identifiable, Hashable {
    var id: String {
        displayItem.mainTitle
    }
    var displayItem: ItemDisplayable
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    static func == (lhs: ListItemDisplayable, rhs: ListItemDisplayable) -> Bool {
        lhs.id == rhs.id
    }
}

struct AlertItem: Identifiable {
    let id = UUID()
    let error: Error
}
