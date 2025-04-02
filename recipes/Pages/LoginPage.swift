//
//  LoginPage.swift
//  recipes
//
//  Created by Atirek Pothiwala on 22/03/25.
//

import SwiftUI

struct LoginPage: View {
        
    @StateObject private var viewModel = AccountVM()
    @State private var email: String = ""
    @State private var password: String = ""
    
    @FocusState private var focusedInput: Field?
    

    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .trailing, spacing: 15) {
                LogoView()
                
                Text("Enter you email address and password for login. Explore food recipes 😋")
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 18, weight: .regular))
                    .frame(maxWidth: .infinity)
                
                tfEmail
                tfPassword
                
                HStack(alignment: .center) {
                    btnRegister
                    btnLogin
                }
                
                btnForgotPassword
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color.accentColor)
        .navigationBarBackButtonHidden()
        .modifier(
            KeyboardModifier(
                onClose: dismissKeyboard,
                onNext: hasReachedEnd() ? nil : nextField,
                onPrev: hasReachedStart() ? nil : prevField
            )
        )
        .safeAreaPadding()
        .onAppear {
            viewModel.fetchAccounts()
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
        SecureField(text: $password) {
            Text("Password")
                .foregroundStyle(.white.opacity(0.25))
        }
        .modifier(TextFieldModifier())
        .focused($focusedInput, equals: .password)
        .keyboardType(.default)
        .textContentType(.password)
        .textInputAutocapitalization(.none)
        .submitLabel(.done)
        .onSubmit {
            focusedInput = .none
        }
    }
    
    var btnForgotPassword: some View {
        NavigationLink {
            ForgotPasswordPage()
        } label: {
            Text("Forgot Password?")
        }
        .foregroundStyle(.white)
        .font(.system(size: 18, weight: .regular))

    }
    
    var btnLogin: some View {
        NavigationLink {
            TabPage()
        } label: {
            Image(systemName: "chevron.right")
        }
        .foregroundStyle(Color.black)
        .font(.system(size: 18, weight: .bold))
        .padding(.all, 16)
        .background(.white, in: .circle)
    }
    
    var btnRegister: some View {
        NavigationLink {
            RegisterPage()
        } label: {
            Text("New Account")
        }
        .foregroundStyle(.white)
        .font(.system(size: 18, weight: .bold))
        .padding(.horizontal, 24)
        .padding(.vertical, 16)
        .background(.black, in: .capsule)
    }
}

private extension LoginPage {
    enum Field: Int, Hashable, CaseIterable {
        case email
        case password
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
    LoginPage()
}
