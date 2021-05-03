//
//  HomeViewModel.swift
//  SUITest
//
//  Created by Gabriel Echeverria on 3/14/21.
//

import Foundation
import SwiftUI

enum HomeItem: String, CaseIterable, Identifiable {
    case films
    case people
    case planets
    case species
    case starships
    case vehicles
    
    var id: String {
        rawValue
    }
    
    var backgroundColor: Color {
        switch self {
        case .films: return .blue
        case .people: return .black
        case .planets: return .green
        case .species: return .yellow
        case .starships: return .gray
        case .vehicles: return .orange
        }
    }
}

struct HomeViewModel {
    var items: [HomeItem] {
        HomeItem.allCases
    }
}
