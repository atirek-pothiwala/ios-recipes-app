//
//  LoginPage.swift
//  recipes
//
//  Created by Atirek Pothiwala on 22/03/25.
//

import SwiftUI

struct LoginPage: View {
    
    @EnvironmentObject var navigator: Navigator
    @EnvironmentObject var toastor: Toastor
    
    @StateObject private var viewModel = LoginVM()
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
        .background(Color.accent)
        .navigationBarBackButtonHidden()
        .applyKeyboardNavigation($focusedInput)
        .applyToast(toastor, viewModel.error, of: .error)
        .safeAreaPadding()
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
            navigator.push(Route.forgotPassword)
        } label: {
            Text("Forgot Password?")
        }
        .foregroundStyle(.white)
        .font(.system(size: 18, weight: .regular))

    }
    
    var btnLogin: some View {
        Button {
            viewModel.login {
                navigator.push(Route.dashboard)
            }
        } label: {
            Image(systemName: "chevron.right")
        }
        .foregroundStyle(Color.black)
        .font(.system(size: 18, weight: .bold))
        .padding(.all, 16)
        .background(.white, in: .circle)
        .disabled(!viewModel.validate)
    }
    
    var btnRegister: some View {
        Button {
            navigator.push(Route.register)
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

#Preview {
    LoginPage()
}
