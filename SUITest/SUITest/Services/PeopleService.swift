//
//  PeopleService.swift
//  SUITest
//
//  Created by Gabriel Echeverria on 3/21/21.
//

import Foundation
import Combine
import Resolver

typealias PeopleResponse = PaginatedResponse<People>

class PeopleService: ContentListServiceType {
    @Injected var service: MoyaRequester
    
    func getItems(for homeItem: HomeItem, page: Int) -> AnyPublisher<[ItemDisplayable], Error> {
        service.execute(decodeTo: PeopleResponse.self, target: ContentRequest.list(content: homeItem.rawValue, page: page))
            .map { $0.results as [ItemDisplayable] }
            .eraseToAnyPublisher()
    }
}

class paginatedPeopleServiceTest {
    @Injected var service: MoyaRequester
    
    func getItems(for homeItem: HomeItem, page: Int) -> AnyPublisher<PeopleResponse, Error> {
        service.execute(decodeTo: PeopleResponse.self, target: ContentRequest.list(content: homeItem.rawValue, page: page))
            .eraseToAnyPublisher()
    }
}
