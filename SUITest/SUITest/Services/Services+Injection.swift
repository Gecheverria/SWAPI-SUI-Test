//
//  Services+Injection.swift
//  SUITest
//
//  Created by Gabriel Echeverria on 4/4/21.
//

import Resolver

extension Resolver {
    public static func registerGeneralService() {
        register {
            MoyaRequesterService(provider: resolve())
        }
        .implements(MoyaRequester.self)
    }
}
