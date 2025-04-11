//
//  List+Extension.swift
//  recipes
//
//  Created by Atirek Pothiwala on 11/04/25.
//

extension Array {
    var lastIndex: Int {
        if self.count == 0 {
            return 0
        }
        return self.count - 1
    }
}
