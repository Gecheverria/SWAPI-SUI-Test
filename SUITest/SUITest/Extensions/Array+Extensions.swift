//
//  Array+Extensions.swift
//  SUITest
//
//  Created by Gabriel Echeverria on 29/4/21.
//

import Foundation

extension Array where Element: Identifiable {
    func shouldPaginate(for item: Element) -> Bool {
        guard let fetchItemIndicator = suffix(5).first else { return false }
        
        return item.id == fetchItemIndicator.id
    }
}
