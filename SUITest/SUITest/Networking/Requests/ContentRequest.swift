//
//  ContentRequest.swift
//  SUITest
//
//  Created by Gabriel Echeverria on 3/16/21.
//

import Foundation
import Moya

enum ContentRequest {
    case list(content: String, page: Int)
}

extension ContentRequest: TargetType {
    var path: String {
        switch self {
        case .list(let content, _): return "\(content)/"
        }
    }
    
    var method:Moya.Method {
        .get
    }
    
    var task: Task {
        switch self {
        case .list(_, let page):
            let parameters: [String: Any] = ["page": page]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }
}
