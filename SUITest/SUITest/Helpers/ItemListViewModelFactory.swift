//
//  ItemListViewModelFactory.swift
//  SUITest
//
//  Created by Gabriel Echeverria on 3/26/21.
//

import Foundation

struct ItemListViewModelFactory {
    static func getItemListViewModelService(for item: HomeItem) -> ContentListServiceType {
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
