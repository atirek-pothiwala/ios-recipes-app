//
//  TextField+Extension.swift
//  recipes
//
//  Created by Atirek Pothiwala on 25/03/25.
//

import UIKit

extension UITextField {
    override open var inputAssistantItem: UITextInputAssistantItem {
        get {
            let item = super.inputAssistantItem
            item.leadingBarButtonGroups = []
            item.trailingBarButtonGroups = []
            return item
        }
    }
}
