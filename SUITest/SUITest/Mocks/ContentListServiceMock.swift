//
//  ContentListServiceMock.swift
//  SUITest
//
//  Created by Gabriel Echeverria on 3/24/21.
//

import Foundation
import Combine

struct ContentListServiceMock: ContentListServiceType {
    func getItems(for homeItem: HomeItem, page: Int) -> AnyPublisher<[ItemDisplayable], Error> {
        let mockData = Film(title: "Film Title", director: "Film Director", summary: "Some summary", episodeNumber: 0)
        
        return Just([mockData]).setFailureType(to: Error.self).eraseToAnyPublisher()
    }
}
