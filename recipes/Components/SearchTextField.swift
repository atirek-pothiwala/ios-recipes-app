//
//  PasswordTextField.swift
//  recipes
//
//  Created by Atirek Pothiwala on 24/03/25.
//

import SwiftUI

struct SearchTextField<Label> : View where Label : View {
    
    @Binding private var text: String
    let label: () -> Label
    let tint: Color
            
    init(text: Binding<String>, tint: Color = Color.white.opacity(0.5), label: @escaping () -> Label) {
        _text = text
        self.tint = tint
        self.label = label
    }
    
    var body: some View {
        HStack {
            TextField(text: $text, label: label)
                .frame(maxWidth: .infinity)
            
            if !text.isEmpty {
                Button {
                    text = ""
                } label: {
                    if !text.isEmpty {
                        Image(systemName: "xmark.circle.fill")
                            .scaledToFit()
                            .foregroundStyle(tint)
                    }
                }
            }
        }
    }
       
}

#Preview {
    VStack {
        SearchTextField(text: Binding.constant("")) {
            Text("Search Recipes")
                .foregroundStyle(.white.opacity(0.25))
        }
        .modifier(TextFieldModifier.normal)
        .safeAreaPadding(.all)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.accent)
}
