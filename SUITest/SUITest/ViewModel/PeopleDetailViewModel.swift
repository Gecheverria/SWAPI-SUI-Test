//
//  PeopleDetailViewModel.swift
//  SUITest
//
//  Created by Gabriel Echeverria on 7/6/21.
//

import Foundation
import Combine
import CombineExt

class PeopleDetailViewModel: ObservableObject {
    let service: PeopleServiceType
    
    @Published private var people: People?
    
    // Input
    let fetchContent: PassthroughRelay<Void> = .init()
    
    // Bindings
    @Published var name: String = ""
    @Published var mainDetails: [DualDetailDisplayable] = []
    @Published var extraDetails: [DualDetailDisplayable] = []
    
    private var subscriptions = Set<AnyCancellable>()
    
    // MARK: - Initializers
    init(service: PeopleServiceType) {
        self.service = service
        
        configure()
    }
    
    // MARK: - Functionality
    private func configure() {
        // WIP
    }
    
    private func configureDetails() {
        // WIP
    }
}
