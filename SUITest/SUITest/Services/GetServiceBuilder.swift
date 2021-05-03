//
//  GetServiceBuilder.swift
//  SUITest
//
//  Created by Gabriel Echeverria on 3/21/21.
//

import Foundation

struct GetServiceBuilder {
    static func getService(for item: HomeItem) -> ContentListServiceType {
        switch item {
        case .films: return FilmsService()
        case .people: return PeopleService()
        case .planets: return PlanetsService()
        case .species: return SpeciesService()
        case .starships: return StarshipService()
        case .vehicles: return VehicleService()
        }
    }
}
