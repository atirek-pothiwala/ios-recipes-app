//
//  RecipeCellModifier.swift
//  recipes
//
//  Created by Atirek Pothiwala on 28/03/25.
//

import SwiftUI

struct RecipeCellModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .listRowBackground(
                Rectangle()
                    .foregroundStyle(Color.accent.opacity(0.1))
            )
            .listRowSeparator(.hidden)
            .listRowInsets(
                EdgeInsets(
                    top: 15,
                    leading: 15,
                    bottom: 15,
                    trailing: 15
                )
            )
    }
}
