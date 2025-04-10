//
//  String+Extension.swift
//  recipes
//
//  Created by Atirek Pothiwala on 10/04/25.
//

import Foundation

extension String {
    var localized: String {
        NSLocalizedString(self, tableName: Constants.shared.language, comment: self)
    }
}
