//
//  String+Random.swift
//  10Spot
//
//  Created by Benjamin W Maer on 2/9/22.
//

import Foundation

extension String {
    func random(length: Int) -> String {
        guard count > 0 else {
            assertionFailure("Should have at least one character to choose randomly from.")
            return ""
        }
        return String((0..<length).map{ _ in self.randomElement()! })
    }
    
    static func random(charactersFrom string: String, length: Int) -> String {
        return string.random(length: length)
    }
}
