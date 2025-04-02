//
//  View+Extension.swift
//  recipes
//
//  Created by Atirek Pothiwala on 24/03/25.
//

import SwiftUICore
import UIKit

extension View {
   @ViewBuilder
   func `if`<Content: View>(_ conditional: Bool, content: (Self) -> Content) -> some View {
        if conditional {
            content(self)
        } else {
            self
        }
    }
}
