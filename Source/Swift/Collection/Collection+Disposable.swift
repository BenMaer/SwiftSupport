//
//  Collection+Disposable.swift
//  10Spot
//
//  Created by Benjamin W Maer on 9/2/21.
//

import Foundation

import RxSwift

extension Collection where Element == Disposable {
    public func dispose() {
        forEach { $0.dispose() }
    }
}
