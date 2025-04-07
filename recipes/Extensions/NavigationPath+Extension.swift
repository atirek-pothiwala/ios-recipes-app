//
//  NavigationPath+Extension.swift
//  recipes
//
//  Created by Atirek Pothiwala on 05/04/25.
//

import SwiftUI

extension NavigationPath {
    mutating func reset(){
        self.removeLast(self.count)
    }
}
