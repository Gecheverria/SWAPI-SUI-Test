//
//  ContentListServiceType.swift
//  SUITest
//
//  Created by Gabriel Echeverria on 3/16/21.
//

import Combine

protocol ContentListServiceType {
    func getItems(for homeItem: HomeItem, page: Int) -> AnyPublisher<[ItemDisplayable], Error>
}
