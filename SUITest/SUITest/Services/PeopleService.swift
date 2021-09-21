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

protocol PeopleServiceType {
    func getPeopleDetail(id: String) -> AnyPublisher<People, Error>
}

struct PeopleService: ContentListServiceType, PeopleServiceType {
    @Injected var service: MoyaRequester
    
    func getItems(for homeItem: HomeItem, page: Int) -> AnyPublisher<PaginatedInformation, Error> {
        service.execute(decodeTo: PeopleResponse.self, target: ContentRequest.list(content: homeItem.rawValue, page: page))
            .map { PaginatedInformation(paginatedResponse: $0) }
            .eraseToAnyPublisher()
    }
    
    func getPeopleDetail(id: String) -> AnyPublisher<People, Error> {
        service.execute(target: ContentRequest.detail(content: HomeItem.people.rawValue, itemID: id))
    }
}
