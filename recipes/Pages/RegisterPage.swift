//
//  RegisterPage.swift
//  recipes
//
//  Created by Atirek Pothiwala on 23/03/25.
//

import SwiftUI

struct RegisterPage: View {
    
    @EnvironmentObject var toastor: Toastor
    @EnvironmentObject var navigator: Navigator
    
    @StateObject private var viewModel = RegisterVM()
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
        .background(Color.accent)
        .modifier(NavigationBarModifier("Create Account") {
            navigator.pop()
        })
        .applyKeyboardNavigation($focusedInput)
        .applyToast(toastor, viewModel.error, of: .error)
        .safeAreaPadding()
    }
    
    var tfFirstName: some View {
        TextField(text: $viewModel.firstName) {
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
        TextField(text: $viewModel.lastName) {
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
        .submitLabel(.next)
        .onSubmit {
            focusedInput = .confirmPassword
        }
    }
    
    var tfConfirmPassword: some View {
        PasswordTextField(text: $viewModel.confirmPassword) {
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
        Button {
            viewModel.register {
                navigator.push(Route.dashboard)
            }
        } label: {
            Image(systemName: "chevron.right")
        }
        .foregroundStyle(Color.black)
        .font(.system(size: 18, weight: .bold))
        .padding(.horizontal, 24)
        .padding(.vertical, 16)
        .background(.white, in: .circle)
        .disabled(!viewModel.validate)
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
}

#Preview {
    RegisterPage()
}
