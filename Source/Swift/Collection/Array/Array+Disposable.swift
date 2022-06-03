//
//  Array+Disposable.swift
//  10Spot
//
//  Created by Benjamin W Maer on 9/2/21.
//

import Foundation

import RxSwift

extension Array: Disposable where Element == Disposable {}
