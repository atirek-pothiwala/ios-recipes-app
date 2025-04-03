//
//  RegisterPage.swift
//  recipes
//
//  Created by Atirek Pothiwala on 23/03/25.
//

import SwiftUI

struct RegisterPage: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""

    @FocusState private var focusedInput: Field?
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .trailing, spacing: 15) {
                Text("Enter your personal details to create account. Explore food recipes 😋")
                    .foregroundStyle(.white)
                    .font(.system(size: 18, weight: .regular))
                    .frame(maxWidth: .infinity, alignment: .leading)

                
                HStack(spacing: 15) {
                    tfFirstName
                    tfLastName
                }
                tfEmail
                tfPassword
                tfConfirmPassword
                
                btnRegister
                
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color.accentColor)
        .modifier(NavigationBarModifier("Create Account") {
            dismiss()
        })
        .applyKeyboardNavigation($focusedInput)
        .safeAreaPadding()
    }
    
    var tfFirstName: some View {
        TextField(text: $email) {
            Text("First Name")
                .foregroundStyle(.white.opacity(0.25))
        }
        .modifier(TextFieldModifier())
        .focused($focusedInput, equals: .firstName)
        .keyboardType(.alphabet)
        .textContentType(.familyName)
        .textInputAutocapitalization(.words)
        .submitLabel(.next)
        .onSubmit {
            focusedInput = .lastName
        }
    }
    
    var tfLastName: some View {
        TextField(text: $email) {
            Text("Last Name")
                .foregroundStyle(.white.opacity(0.25))
        }
        .modifier(TextFieldModifier())
        .focused($focusedInput, equals: .lastName)
        .keyboardType(.alphabet)
        .textContentType(.familyName)
        .textInputAutocapitalization(.words)
        .submitLabel(.next)
        .onSubmit {
            focusedInput = .email
        }
    }
    
    var tfEmail: some View {
        TextField(text: $email) {
            Text("Email Address")
                .foregroundStyle(.white.opacity(0.25))
        }
        .modifier(TextFieldModifier())
        .focused($focusedInput, equals: .email)
        .keyboardType(.emailAddress)
        .textContentType(.emailAddress)
        .textInputAutocapitalization(.never)
        .submitLabel(.next)
        .onSubmit {
            focusedInput = .password
        }
    }
    
    var tfPassword: some View {
        PasswordTextField(text: $password) {
            Text("Password")
                .foregroundStyle(.white.opacity(0.25))
        }
        .modifier(TextFieldModifier())
        .focused($focusedInput, equals: .password)
        .keyboardType(.default)
        .textContentType(.password)
        .textInputAutocapitalization(.none)
        .submitLabel(.next)
        .onSubmit {
            focusedInput = .confirmPassword
        }
    }
    
    var tfConfirmPassword: some View {
        PasswordTextField(text: $confirmPassword) {
            Text("Confirm Password")
                .foregroundStyle(.white.opacity(0.25))
        }
        .modifier(TextFieldModifier())
        .focused($focusedInput, equals: .confirmPassword)
        .keyboardType(.default)
        .textContentType(.password)
        .textInputAutocapitalization(.none)
        .submitLabel(.done)
        .onSubmit {
            focusedInput = .none
        }
    }
    
    var btnRegister: some View {
        NavigationLink {
            TabPage()
        } label: {
            Image(systemName: "chevron.right")
        }
        .foregroundStyle(Color.black)
        .font(.system(size: 18, weight: .bold))
        .padding(.horizontal, 24)
        .padding(.vertical, 16)
        .background(.white, in: .circle)
    }

}

private extension RegisterPage {
    enum Field: Int, Hashable, CaseIterable {
        case firstName
        case lastName
        case email
        case password
        case confirmPassword
    }
    
    func dismissKeyboard() {
        self.focusedInput = nil
    }
    
    func nextField() {
        guard let currentInput = focusedInput,
        let lastIndex = Field.allCases.last?.rawValue else { return }
        
        let index = min(currentInput.rawValue + 1, lastIndex)
        self.focusedInput = Field(rawValue: index)
    }
    
    func prevField() {
        guard let currentInput = focusedInput,
        let firstIndex = Field.allCases.first?.rawValue else { return }
        
        let index = max(currentInput.rawValue - 1, firstIndex)
        self.focusedInput = Field(rawValue: index)
    }
    
    func hasReachedStart() -> Bool {
        self.focusedInput == Field.allCases.first
    }
    
    func hasReachedEnd() -> Bool {
        self.focusedInput == Field.allCases.last
    }
}

#Preview {
    NavigationStack {
        RegisterPage()
    }
}
