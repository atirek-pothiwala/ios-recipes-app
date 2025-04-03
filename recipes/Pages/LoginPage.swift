//
//  LoginPage.swift
//  recipes
//
//  Created by Atirek Pothiwala on 22/03/25.
//

import SwiftUI

struct LoginPage: View {
        
    @State private var path = NavigationPath()
    @StateObject private var viewModel = LoginVM()
    @FocusState private var focusedInput: Field?

    var body: some View {
        NavigationStack(path: $path) {
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
            .applyKeyboardNavigation($focusedInput)
            .safeAreaPadding()
            .navigationDestination(for: Route.self) { route in
                if route == .dashboard {
                    TabPage()
                } else if route == .register {
                    RegisterPage()
                } else if route == .forgotPassword {
                    ForgotPasswordPage()
                }
            }
        }
    }
    
    var tfEmail: some View {
        TextField(text: $viewModel.email) {
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
        PasswordTextField(text: $viewModel.password) {
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
        Button {
            self.path.append(Route.forgotPassword)
        } label: {
            Text("Forgot Password?")
        }
        .foregroundStyle(.white)
        .font(.system(size: 18, weight: .regular))

    }
    
    var btnLogin: some View {
        Button {
            viewModel.login {
                self.path.append(Route.dashboard)
            }
        } label: {
            Image(systemName: "chevron.right")
        }
        .foregroundStyle(Color.black)
        .font(.system(size: 18, weight: .bold))
        .padding(.all, 16)
        .background(.white, in: .circle)
    }
    
    var btnRegister: some View {
        Button {
            self.path.append(Route.register)
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
}

private extension LoginPage {
    enum Route: Hashable {
        case dashboard
        case register
        case forgotPassword
    }
}

#Preview {
    LoginPage()
}
