//
//  ContentListServiceMock.swift
//  SUITest
//
//  Created by Gabriel Echeverria on 3/24/21.
//

import Foundation
import Combine

struct ContentListServiceMock: ContentListServiceType {
    func getItems(for homeItem: HomeItem, page: Int) -> AnyPublisher<PaginatedInformation, Error> {
        let data = PaginatedInformation(data: [Film(title: "Film Title", director: "Film Director", summary: "Some summary", episodeNumber: 0, url: "")],
                                        currentPage: 0, shouldRequestNextPage: false, nextPage: 0)
        
        return Just(data).setFailureType(to: Error.self).eraseToAnyPublisher()
    }
}
