//
//  String+PathComponents.swift
//  10Spot
//
//  Created by Benjamin W Maer on 8/26/21.
//

import Foundation

extension String {
    // MARK: - Path Components
    init(pathComponents: [String], fileName: String? = nil) {
        let pathComponents = pathComponents.map({ component in
            return component.trimmingCharacters(in: CharacterSet(charactersIn: "/"))
        })
        
        let finalComponents = ([pathComponents, [fileName]] as [[String?]]).flatMap().compactMap()
        assert({
            for finalComponent in finalComponents {
                if finalComponent.isEmpty { return false }
            }
            return true
        }(), "shouldn't have any empty path components")
        self.init(stringLiteral: finalComponents.joined(separator: "/"))
    }
    
    func appendToPath(path: String) -> String {
        return String(pathComponents: [self, path])
    }
    
    func appendToPath(pathComponents: [String]) -> String {
        return String(pathComponents: [self, String(pathComponents: pathComponents)])
    }
    
    func prependToFileName(pathComponents: [String]) -> String {
        return String(pathComponents: pathComponents, fileName: self)
    }
    
    // MARK: - Path
    init(path: String, fileName: String? = nil) {
        self.init(pathComponents: [path, fileName].compactMap { $0 })
    }
    
    func appendToPath(fileName: String) -> String {
        return String(path: self, fileName: fileName)
    }
}

extension Array where Element == String {
    func appendToPathComponents(fileName: Element) -> Element {
        return Element(pathComponents: self, fileName: fileName)
    }
    
    var pathFromComponents: String {
        return Element(pathComponents: self)
    }
}
