//
//  String+NSLocalizedString.swift
//  10Spot
//
//  Created by Benjamin W Maer on 9/1/21.
//

import Foundation

extension String {
    var nsLocalizedString: String { NSLocalizedString(self, comment: self) }
}
