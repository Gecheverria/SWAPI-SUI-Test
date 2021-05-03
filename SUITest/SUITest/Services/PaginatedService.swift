////
////  PaginatedService.swift
////  SUITest
////
////  Created by Gabriel Echeverria on 4/7/21.
////
//
//import Foundation
//import Moya
//import CombineExt
//import Combine
//import Resolver
//
//enum PaginationState {
//    case paginate
//    case finished
//    case fetching
//    case completed
//}
//
//protocol PaginatedServiceType {
//
//}
//
//class PaginatedService<T: Decodable> {
//    typealias Response = PaginatedResponse<T>
//
//    private let state: CurrentValueRelay<PaginationState> = .init(.paginate)
//    private let paginateInput: AnyPublisher<Void, Never>
//
//    @Injected var service: paginatedPeopleServiceTest
//
//    // Outputs
//    private let data: CurrentValueRelay<Response>
//    let error: PassthroughRelay<Error>
//
//    var paginatedData: AnyPublisher<Response, Never> {
//        data.dropFirst().eraseToAnyPublisher()
//    }
//
//    init(paginateInput: AnyPublisher<Void, Never>) {
//        self.paginateInput = paginateInput
//        self.data = .init(Response(count: 0, next: nil, previous: nil, results: []))
//
//        configure()
//    }
//
//    private func configure() {
////        let pagination = paginateInput
////            .withLatestFrom(state)
////            .filter { $0 == .paginate }
////            .map { _ -> PaginationState in
////                return PaginationState.fetching
////            }
////            .withLatestFrom(paginatedData)
////            .setFailureType(to: Error.self)
////            .filter { $0.nextPage != nil }
////            .flatMap { [service] pagination -> Publishers.Materialize<AnyPublisher<PeopleResponse, Error>> in
////                service.getItems(for: .people, page: pagination.nextPage ?? 0)
////            }
////            .share()
////            .eraseToAnyPublisher()
//
//    }
//}
