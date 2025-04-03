//
//  NavigationBarModifier.swift
//  recipes
//
//  Created by Atirek Pothiwala on 24/03/25.
//

import SwiftUI

typealias KeyboardFocusType = Hashable & CaseIterable & RawRepresentable

struct KeyboardModifier<T: KeyboardFocusType>: ViewModifier where T.RawValue == Int {
    @FocusState.Binding var focusedField: T?
    private var allFields: [T] { Array(T.allCases) }
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button {
                        dismissKeyboard()
                    } label: {
                        Text("Close")
                    }
                    .foregroundStyle(.black)
                    
                    Spacer()
                    
                    Button {
                        prevField()
                    } label: {
                        Image(systemName: "chevron.up")
                    }.disabled(hasReachedStart())
                    
                    Button {
                        nextField()
                    } label: {
                        Image(systemName: "chevron.down")
                    }.disabled(hasReachedEnd())
                }
            }
            .ignoresSafeArea(.keyboard, edges: .all)
    }
    
    // Dismiss keyboard
    private func dismissKeyboard() {
        focusedField = nil
    }
    
    // Move to the next field
    private func nextField() {
        guard let current = focusedField,
              let last = allFields.last?.rawValue else { return }
        
        let index = min(current.rawValue + 1, last)
        focusedField = T(rawValue: index)
    }
    
    // Move to the previous field
    private func prevField() {
        guard let current = focusedField,
              let first = allFields.first?.rawValue else { return }
        
        let index = max(current.rawValue - 1, first)
        focusedField = T(rawValue: index)
    }
    
    // Check if at the start
    private func hasReachedStart() -> Bool {
        focusedField == allFields.first
    }
    
    // Check if at the end
    private func hasReachedEnd() -> Bool {
        focusedField == allFields.last
    }
}

extension View {
    func applyKeyboardNavigation<T: Hashable & CaseIterable & RawRepresentable>(_ focusedField: FocusState<T?>.Binding) -> some View where T.RawValue == Int {
        self.modifier(KeyboardModifier(focusedField: focusedField))
    }
}
