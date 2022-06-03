//
//  Result+Values.swift
//  10Spot
//
//  Created by Benjamin W Maer on 8/30/21.
//

import Foundation

extension Result {
    var success: Success? {
        if case let .success(s) = self { return s }
        return nil
    }
    
    var isSuccess: Bool { success != nil }
    
    var failure: Failure? {
        if case let .failure(f) = self { return f }
        return nil
    }
    
    var isFailure: Bool { failure != nil }
}
