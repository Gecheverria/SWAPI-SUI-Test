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
    @Published private var lastResponse = PaginatedInformation(data: [], currentPage: 0, shouldRequestNextPage: true, nextPage: 1)
    
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
        let triggerPublisher = fetchContent
            .withLatestFrom($lastResponse)
            .shouldPerformPagination()
            .share()
        
        let fetchDataPublisher = triggerPublisher
            .flatMap { [weak self, service] lastResponse in
                service
                    .getItems(for: self?.homeItem ?? .films, page: self?.lastResponse.nextPage ?? 0)
                    .materialize()
            }
            .receive(on: DispatchQueue.main)
            .share()
        
        let valuesPublisher = fetchDataPublisher
            .values()
            .share()
        
        let failurePublisher = fetchDataPublisher
            .failures()
            .share()

        triggerPublisher
            .map { _ in true }
            .assign(to: \.isLoading, on: self, ownership: .weak)
            .store(in: &subscriptions)
        
        fetchDataPublisher
            .map { _ in false }
            .assign(to: \.isLoading, on: self, ownership: .weak)
            .store(in: &subscriptions)
        
        valuesPublisher
            .assign(to: \.lastResponse, on: self, ownership: .weak)
            .store(in: &subscriptions)
        
        valuesPublisher
            .map { $0.data.map { ListItemDisplayable(displayItem: $0) } }
            .aggregate(concatenated: true)
            .assign(to: \.items, on: self, ownership: .weak)
            .store(in: &subscriptions)
        
        failurePublisher
            .map { AlertItem(error: $0) }
            .assign(to: \.errorItem, on: self, ownership: .weak)
            .store(in: &subscriptions)
        
        failurePublisher
            .combineLatest($lastResponse)
            .map { _, lastResponse in
                var lastResponse = lastResponse
                lastResponse.errorWasThrown = true
                
                return lastResponse
            }
            .assign(to: \.lastResponse, on: self, ownership: .weak)
            .store(in: &subscriptions)
    }
}
