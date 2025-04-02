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
    
    @State var showPassword: Bool = false
        
    init(text: Binding<String>, label: @escaping () -> Label) {
        _text = text
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
                        .foregroundStyle(.white.opacity(0.5))
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
    .background(Color.accentColor)
}
