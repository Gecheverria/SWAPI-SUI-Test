//
//  PaginatedInformation.swift
//  SUITest
//
//  Created by Gabriel Echeverria on 3/5/21.
//

import Foundation

struct PaginatedInformation: PaginationProviderType {
    let data: [ItemDisplayable]
    
    var currentPage: Int
    var shouldRequestNextPage: Bool
    var nextPage: Int
    var errorWasThrown: Bool?
    
    init(data: [ItemDisplayable], currentPage: Int, shouldRequestNextPage: Bool, nextPage: Int, errorWasThrown: Bool? = nil) {
        self.data = data
        self.currentPage = currentPage
        self.shouldRequestNextPage = shouldRequestNextPage
        self.nextPage = nextPage
        self.errorWasThrown = errorWasThrown
    }
    
    init<T: ItemDisplayable>(paginatedResponse: PaginatedResponse<T>) {
        self.data = paginatedResponse.results
        self.shouldRequestNextPage = paginatedResponse.next != nil
        
        if let nextURLString = paginatedResponse.next, let nextURL = URL(string: nextURLString) {
            let components = URLComponents(url: nextURL, resolvingAgainstBaseURL: false)
            
            self.nextPage = Int(components?.queryItems?.first?.value ?? "") ?? -1
        } else {
            self.nextPage = -1
        }
        self.currentPage = nextPage - 1
    }
}
