//
//  PlanetsService.swift
//  SUITest
//
//  Created by Gabriel Echeverria on 3/21/21.
//

import Foundation
import Combine
import Resolver

typealias PlanetResponse = PaginatedResponse<Planet>

class PlanetsService: ContentListServiceType {
    @Injected var service: MoyaRequester
    
    func getItems(for homeItem: HomeItem, page: Int) -> AnyPublisher<[ItemDisplayable], Error> {
        service.execute(decodeTo: PlanetResponse.self, target: ContentRequest.list(content: homeItem.rawValue, page: page))
            .map { $0.results as [ItemDisplayable] }
            .eraseToAnyPublisher()
    }
}
