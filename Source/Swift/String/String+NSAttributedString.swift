//
//  String+NSAttributedString.swift
//  10Spot
//
//  Created by Benjamin W Maer on 9/21/21.
//

import Foundation

extension String {
    func attributedString(with attributes: NSAttributedString.Attributes) -> NSAttributedString { .init(string: self, attributes: attributes) }
}
