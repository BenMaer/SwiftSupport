//
//  Integers+Mod.swift
//  10Spot
//
//  Created by Benjamin Maer on 5/31/22.
//

import Foundation

extension Int {
    func mod(_ modulus: Int) -> Int {
        precondition(modulus > 0, "modulus must be positive")
        let result = self % modulus
        return result >= 0 ? result : result + modulus
    }
}
