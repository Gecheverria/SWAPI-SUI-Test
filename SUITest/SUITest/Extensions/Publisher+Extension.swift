//
//  Publisher+Extension.swift
//  SUITest
//
//  Created by Gabriel Echeverria on 29/4/21.
//

import Combine
import CombineExt

extension Publisher where Output: Hashable, Output.Element: Hashable, Output: Sequence {
    
    /// A wrapper of combine scan operator, with the option to either concatenate the results, or not.
    /// - Parameter concatenated: A Boolean that defines whether the last items should be appended to the new values
    /// - Returns: A publisher with the array of the elements
    func aggregate(concatenated: Bool) -> AnyPublisher<[Output.Element], Failure> {
        scan([]) { latest, current in
            let previousItems = Set(latest)
            let newItems = Set(current)
            
            var items: [Output.Element] = []
            
            guard !newItems.isSubset(of: previousItems) else {
                items.append(contentsOf: latest)
                
                return items
            }
            
            if concatenated {
                items.append(contentsOf: latest)
            }
            
            items.append(contentsOf: current)
            
            return items
        }
        .eraseToAnyPublisher()
    }
}

extension Publisher where Output: PaginationProviderType {
    func shouldPerformPagination() -> AnyPublisher<Output, Failure> {
        removeDuplicates { latest, current in
            (latest.currentPage == current.currentPage) && !(current.errorWasThrown ?? false)
        }
        .filter { $0.shouldRequestNextPage }
        .eraseToAnyPublisher()
    }
}
