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
                
                Text("login_info".localized)
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
            Text("email_address".localized)
                .foregroundStyle(.white.opacity(0.25))
        }
        .modifier(TextFieldModifier.normal)
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
            Text("password".localized)
                .foregroundStyle(.white.opacity(0.25))
        }
        .modifier(TextFieldModifier.normal)
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
            Text("forgot_password".localized)
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
        .foregroundStyle(Color.accent)
        .font(.system(size: 18, weight: .bold))
        .padding(.all, 16)
        .background(.white, in: .circle)
        .disabled(!viewModel.validate)
    }
    
    var btnRegister: some View {
        Button {
            navigator.push(Route.register)
        } label: {
            Text("new_account".localized)
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
