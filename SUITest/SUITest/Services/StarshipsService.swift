//
//  StarshipsService.swift
//  SUITest
//
//  Created by Gabriel Echeverria on 3/21/21.
//

import Foundation
import Combine
import Resolver

typealias StarshipResponse = PaginatedResponse<StarShip>

struct StarshipService: ContentListServiceType {
    @Injected var service: MoyaRequester
    
    func getItems(for homeItem: HomeItem, page: Int) -> AnyPublisher<PaginatedInformation, Error> {
        service.execute(decodeTo: StarshipResponse.self, target: ContentRequest.list(content: homeItem.rawValue, page: page))
            .map { PaginatedInformation(paginatedResponse: $0) }
            .eraseToAnyPublisher()
    }
}
