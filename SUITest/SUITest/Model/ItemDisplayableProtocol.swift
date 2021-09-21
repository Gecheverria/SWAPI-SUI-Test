//
//  ItemDisplayableProtocol.swift
//  SUITest
//
//  Created by Gabriel Echeverria on 3/21/21.
//

import Foundation

protocol ItemDisplayable: Decodable {
    var id: Int? { get }
    var mainTitle: String { get }
    var subTitle: String? { get }
}
