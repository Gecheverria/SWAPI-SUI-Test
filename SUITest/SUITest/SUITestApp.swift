//
//  SUITestApp.swift
//  SUITest
//
//  Created by Gabriel Echeverria on 3/14/21.
//

import SwiftUI
import Resolver

@main
struct SUITestApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
            }
            .onAppear {
                Resolver.registerAllServices()
            }
        }
    }
}
