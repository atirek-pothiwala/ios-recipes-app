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
    
    func renderSize(ratio: CGSize? = nil, _ onSize: @escaping (CGSize) -> Void) -> some View {
        return self.onGeometryChange(for: CGRect.self) { proxy in
            proxy.frame(in: .global)
        } action: { newValue in
            guard ratio != nil else {
                onSize(newValue.size)
                return
            }
            let size = CGSize(
                width: newValue.width * ratio!.width,
                height: newValue.width * ratio!.height
            )
            onSize(size)
        }
    }
    
    func resize(_ size: CGSize) -> some View {
        self.frame(
            width: size.width,
            height: size.height
        )
    }
}
