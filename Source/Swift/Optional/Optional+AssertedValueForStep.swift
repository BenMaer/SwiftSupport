//
//  Optional+AssertedValueForStep.swift
//  10Spot
//
//  Created by Benjamin W Maer on 3/7/22.
//

import Foundation

import RxFlow

extension Optional {
    @inlinable func assertedValue<T: Step>(for step: Step, expectedType: T.Type) -> Self {
        return assertedValue(message:   """
                                        step: \(step)
                                        should have been type: \(T.self)
                                        """)
    }
}
