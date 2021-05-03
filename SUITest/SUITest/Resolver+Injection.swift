//
//  Resolver+Injection.swift
//  SUITest
//
//  Created by Gabriel Echeverria on 4/4/21.
//

import Foundation
import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        registerMoyaRequesterService()
        registerGeneralService()
    }
}
