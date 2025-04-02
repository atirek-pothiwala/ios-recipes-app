//
//  Screen+Extension.swift
//  recipes
//
//  Created by Atirek Pothiwala on 23/03/25.
//

import UIKit

extension UIScreen {
    static func dismissKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil, from: nil, for: nil)
    }
}
