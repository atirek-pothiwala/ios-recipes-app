//
//  PasswordTextField.swift
//  recipes
//
//  Created by Atirek Pothiwala on 24/03/25.
//

import SwiftUI

struct PasswordTextField<Label> : View where Label : View {
    
    @Binding private var text: String
    let label: () -> Label
    let tint: Color
    
    @State var showPassword: Bool = false
        
    init(text: Binding<String>, tint: Color = Color.white.opacity(0.5), label: @escaping () -> Label) {
        _text = text
        self.tint = tint
        self.label = label
    }
    
    var body: some View {
        HStack {
            if showPassword {
                TextField(text: $text, label: label)
                    .frame(maxWidth: .infinity)
            } else {
                SecureField(text: $text, label: label)
                    .frame(maxWidth: .infinity)
            }
            
            if !text.isEmpty {
                Button {
                    showPassword.toggle()
                } label: {
                    Image(systemName: showPassword ? "eye.fill" : "eye.slash.fill")
                        .scaledToFit()
                        .foregroundStyle(tint)
                }
            }
        }
    }
       
}

#Preview {
    VStack {
        PasswordTextField(text: Binding.constant("test-password")) {
            Text("Email Address")
                .foregroundStyle(.white.opacity(0.25))
        }
        .modifier(TextFieldModifier())
        .safeAreaPadding(.all)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.accent)
}
