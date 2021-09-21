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
    case detail(content: String, itemID: String)
}

extension ContentRequest: TargetType {
    var path: String {
        switch self {
        case .list(let content, _): return "\(content)/"
        case .detail(let content, let itemID): return "\(content)/\(itemID)/"
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
        default:
            return .requestPlain
        }
    }
}
