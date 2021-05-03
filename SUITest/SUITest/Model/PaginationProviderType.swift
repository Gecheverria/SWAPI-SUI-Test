//
//  PaginationProviderType.swift
//  SUITest
//
//  Created by Gabriel Echeverria on 30/4/21.
//

import Foundation

protocol PaginationProviderType {
    var currentPage: Int { get }
    var shouldRequestNextPage: Bool { get }
    var nextPage: Int { get }
    var errorWasThrown: Bool? { get set }
}
