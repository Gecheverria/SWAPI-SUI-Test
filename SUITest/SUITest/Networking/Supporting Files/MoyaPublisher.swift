//
//  MoyaPublisher.swift
//  SUITest
//
//  Created by Gabriel Echeverria on 3/15/21.
//

import Moya
import Foundation
import Combine

// This should be already provided in Combine, but it's not.
// Ideally we would like to remove it, in favor of a framework-provided solution, ASAP.

class MoyaPublisher<Output>: Publisher {
    
    typealias Failure = MoyaError
    
    private class Subscription: Combine.Subscription {
        
        private let cancellable: Moya.Cancellable?
        
        init(subscriber: AnySubscriber<Output, MoyaError>, callback: @escaping (AnySubscriber<Output, MoyaError>) -> Moya.Cancellable?) {
            self.cancellable = callback(subscriber)
        }
        
        func request(_ demand: Subscribers.Demand) {
            // We don't care for the demand right now
        }
        
        func cancel() {
            cancellable?.cancel()
        }
    }
    
    private let callback: (AnySubscriber<Output, MoyaError>) -> Moya.Cancellable?
    
    init(callback: @escaping (AnySubscriber<Output, MoyaError>) -> Moya.Cancellable?) {
        self.callback = callback
    }
    
    func receive<S>(subscriber: S) where S: Subscriber, Failure == S.Failure, Output == S.Input {
        let subscription = Subscription(subscriber: AnySubscriber(subscriber), callback: callback)
        subscriber.receive(subscription: subscription)
    }
}
