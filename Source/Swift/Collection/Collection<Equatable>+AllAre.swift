//
//  Collection<Equatable>+AllAre.swift
//  10Spot
//
//  Created by Benjamin W Maer on 8/30/21.
//

import Foundation

import RxSwift

extension Collection where Element: Equatable {
    /// Tests that all items in a collection are equal to an item.
    /// - Parameter value: Item to compare to the all the items in the collection.
    /// - Returns: If all items in the collection are equal to the `value` param, returns `true`, otherwise returns `false`.
    func allAre(_ value: Element) -> Bool { allSatisfy({ $0 == value })}
}

extension Collection {
    /// Tests that all items in a collection in an observable sequence are equal to an item.
    /// - Parameter value: Item to compare to the all the items in the collection in an observable sequence.
    /// - Returns: If all items in the collection in an observable sequence are equal to the `value` param, returns `true`, otherwise returns `false`.
    func allAre<E: Equatable>(_ value: E) -> Observable<Bool> where Element: ObservableType, Element.Element == E { Observable.combineLatest(self).map({ $0.allAre(value) })}
    
    @available(*, deprecated, message: "Shouldn't be used on objects")
    func allAre<E: Equatable & AnyObject>(_ value: E) -> Observable<Bool> where Element: ObservableType, Element.Element == E {
        assertionFailure("Shouldn't use this on objects, since retain policy is unknown")
        return Observable.empty()
    }
}
