//
//  MoyaRequester.swift
//  SUITest
//
//  Created by Gabriel Echeverria on 3/16/21.
//

import Foundation
import Combine
import Moya
import Resolver

struct DataResponse {
    let data: Data
    let httpResponse: HTTPURLResponse?
}

protocol MoyaRequester {
    func execute(target: TargetType) -> AnyPublisher<DataResponse, MoyaError>
    func executeNoBodyRequest(target: TargetType) -> AnyPublisher<HTTPURLResponse?, MoyaError>
}

extension MoyaRequester {
    func execute<T: Decodable>(decodeTo type: T.Type = T.self, target: TargetType, decoder: JSONDecoder = .init()) -> AnyPublisher<T, Error> {
        execute(target: target)
            .map(\.data)
            .decode(type: T.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
}

class MoyaRequesterService: MoyaRequester {
    @Injected var provider: MoyaProvider<MultiTarget>
    
    init(provider: MoyaProvider<MultiTarget>) {
        self.provider = provider
    }
    
    func execute(target: TargetType) -> AnyPublisher<DataResponse, MoyaError> {
        provider.requestPublisher(MultiTarget(target))
            .map { DataResponse(data: $0.data, httpResponse: $0.response) }
            .eraseToAnyPublisher()
    }
    
    func executeNoBodyRequest(target: TargetType) -> AnyPublisher<HTTPURLResponse?, MoyaError> {
        provider.requestPublisher(MultiTarget(target))
            .map { $0.response }
            .eraseToAnyPublisher()
    }
}

extension TargetType {
    var baseURL: URL {
        URL(string: "https://swapi.dev/api/")!
    }
    
    var validationType: ValidationType {
        .successCodes
    }
    
    var headers: [String: String]? {
        ["ContentType": "application/json"]
    }
    
    var sampleData: Data {
        Data()
    }
}
