//
//  MoyaRequester+Injection.swift
//  SUITest
//
//  Created by Gabriel Echeverria on 4/4/21.
//

import Foundation
import Resolver
import Moya

extension Resolver {
    public static func registerMoyaRequesterService() {
        register {
            MoyaProvider<MultiTarget>(plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))])
        }
    }
}
