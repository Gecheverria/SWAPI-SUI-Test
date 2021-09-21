//
//  FIlmsService.swift
//  SUITest
//
//  Created by Gabriel Echeverria on 3/21/21.
//

import Foundation
import Combine
import Resolver

typealias FilmResponse = PaginatedResponse<Film>

struct FilmsService: ContentListServiceType {
    @Injected var service: MoyaRequester
    
    func getItems(for homeItem: HomeItem, page: Int) -> AnyPublisher<PaginatedInformation, Error> {
        service.execute(decodeTo: FilmResponse.self, target: ContentRequest.list(content: homeItem.rawValue, page: page))
            .map { PaginatedInformation(paginatedResponse: $0) }
            .eraseToAnyPublisher()
    }
}
