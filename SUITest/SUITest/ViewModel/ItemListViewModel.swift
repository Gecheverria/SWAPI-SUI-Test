//
//  ItemListViewModel.swift
//  SUITest
//
//  Created by Gabriel Echeverria on 3/21/21.
//

import Foundation
import Resolver
import Combine
import CombineExt

class ItemListViewModel: ObservableObject {
    private let service: ContentListServiceType
    let homeItem: HomeItem
    
    private var subscriptions = Set<AnyCancellable>()
    
    // Input
    let fetchContent: PassthroughRelay<Void> = .init()
    
    // Bindings
    @Published var items: [ListItemDisplayable] = []
    @Published var errorItem: AlertItem? // Use Alert Item for multiple alerts
    @Published var isLoading = false
    
    init(service: ContentListServiceType, homeItem: HomeItem) {
        self.service = service
        self.homeItem = homeItem
        
        configure()
    }
    
    private func configure() {
        let servicePublisher = fetchContent
                .share()
        
        let dataPublisher = servicePublisher
                .flatMapLatest { [service, homeItem] in
                    service.getItems(for: homeItem, page: 1)
                        .materialize()
                }
                .receive(on: DispatchQueue.main)
                .share()
        
        servicePublisher
            .map { true }
            .assign(to: \.isLoading, on: self, ownership: .weak)
            .store(in: &subscriptions)
        
        dataPublisher
            .map { _ in false }
            .assign(to: \.isLoading, on: self, ownership: .weak)
            .store(in: &subscriptions)
        
        dataPublisher
            .values()
            .map { $0.map { ListItemDisplayable(displayItem: $0) } }
            .assign(to: \.items, on: self, ownership: .weak)
            .store(in: &subscriptions)

        dataPublisher
            .failures()
            .map { AlertItem(error: $0) }
            .assign(to: \.errorItem, on: self, ownership: .weak)
            .store(in: &subscriptions)
    }
}

struct ListItemDisplayable: Identifiable {
    var id: UUID = UUID()
    var displayItem: ItemDisplayable
}

struct AlertItem: Identifiable {
    let id = UUID()
    let error: Error
}
