//
//  String+Subscript.swift
//  10Spot
//
//  Created by Benjamin W Maer on 11/3/21.
//

import Foundation

extension StringProtocol {
    subscript(_ offset: Int) -> Element { self[index(startIndex, offsetBy: offset)] }
}
