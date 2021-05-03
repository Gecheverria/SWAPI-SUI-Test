//
//  PaginatedResponse.swift
//  SUITest
//
//  Created by Gabriel Echeverria on 3/21/21.
//

import Foundation

struct PaginatedResponse<T: Decodable>: Decodable, PaginationProviderType {
    let count: Int
    let next: String?
    let previous: String?
    let results: [T]
    
    // PaginationProviderType
    var currentPage: Int {
        nextPage - 1
    }
    var shouldRequestNextPage: Bool {
        next != nil
    }
    var nextPage: Int {
        guard let nextURLString = next, let nextURL = URL(string: nextURLString) else { return -1 }
        
        let components = URLComponents(url: nextURL, resolvingAgainstBaseURL: false)
        
        return Int(components?.queryItems?.first?.value ?? "") ?? -1
    }
    var errorWasThrown: Bool?
}
