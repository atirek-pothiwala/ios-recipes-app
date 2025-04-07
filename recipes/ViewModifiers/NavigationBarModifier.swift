//
//  NavigationBarModifier.swift
//  recipes
//
//  Created by Atirek Pothiwala on 24/03/25.
//

import SwiftUI

struct NavigationBarModifier: ViewModifier {
    
    typealias OnClick = () -> Void
    
    var title: String
    var onBack: OnClick?
    
    init(_ title: String, _ onBack: OnClick? = nil) {
        self.title = title
        self.onBack = onBack
    }
    
    func body(content: Content) -> some View {
        content
            .navigationTitle(title)
            .navigationBarBackButtonHidden()
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                if (onBack != nil) {
                    ToolbarItem(placement: .topBarLeading) {
                        BackButton("Back") {
                            onBack?()
                        }
                    }
                }
            }
    }
}
