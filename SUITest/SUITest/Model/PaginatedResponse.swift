//
//  PaginatedResponse.swift
//  SUITest
//
//  Created by Gabriel Echeverria on 3/21/21.
//

import Foundation

struct PaginatedResponse<T: Decodable>: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [T]
}
