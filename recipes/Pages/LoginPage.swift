//
//  LoginPage.swift
//  recipes
//
//  Created by Atirek Pothiwala on 22/03/25.
//

import SwiftUI

struct LoginPage: View {
    
    @State private var email: String = ""
    @FocusState private var isFocusedEmail: Bool

    @State private var password: String = ""
    @FocusState private var isFocusedPassword: Bool
    @State var showPassword: Bool = false

    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            
            LogoView()
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 15) {
                tfEmail
                tfPassword
                
                HStack(alignment: .center) {
                    btnRegister
                    btnLogin
                }
            }
            
            Spacer()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.accentColor)
        .safeAreaPadding()
    }
    
    var tfEmail: some View {
        TextField(text: $email) {
            Text("Email Address")
                .foregroundStyle(.white.opacity(0.25))
        }
        .font(.system(size: 18, weight: .regular))
        .textContentType(.emailAddress)
        .focused($isFocusedEmail)
        .textInputAutocapitalization(.never)
        .keyboardType(.emailAddress)
        .foregroundStyle(.white)
        .tint(.white)
        .frame(maxWidth: .infinity)
        .padding()
        .background(.black.opacity(0.15), in: .buttonBorder)
        .submitLabel(.next)
        .onSubmit {
            isFocusedEmail = false
            isFocusedPassword = true
        }
    }
    
    var tfPassword: some View {
        HStack {
            if showPassword {
                tfUnsecurePassword
            } else {
                tfSecurePassword
            }
            Button {
                showPassword.toggle()
            } label: {
                Image(systemName: showPassword ? "eye.fill" : "eye.slash.fill")
                    .scaledToFit()
                    .foregroundStyle(.white.opacity(0.5))
                    .padding()
            }

        }
        .frame(maxWidth: .infinity)
        .background(.black.opacity(0.15), in: .buttonBorder)
        
    }
    
    var tfUnsecurePassword: some View {
        TextField(text: $password) {
            Text("Password")
                .foregroundStyle(.white.opacity(0.25))
        }
        .font(.system(size: 18, weight: .regular))
        .textContentType(.password)
        .focused($isFocusedPassword)
        .keyboardType(.default)
        .foregroundStyle(.white)
        .tint(.white)
        .frame(maxWidth: .infinity)
        .padding()
        .submitLabel(.done)
        .onSubmit {
            UIScreen.dismissKeyboard()
        }
    }
    
    var tfSecurePassword: some View {
        SecureField(text: $password) {
            Text("Password")
                .foregroundStyle(.white.opacity(0.25))
        }
        .textContentType(.password)
        .focused($isFocusedPassword)
        .keyboardType(.default)
        .foregroundStyle(.white)
        .tint(.white)
        .frame(maxWidth: .infinity)
        .padding()
        .submitLabel(.done)
        .onSubmit {
            UIScreen.dismissKeyboard()
        }
    }
    
    var btnLogin: some View {
        NavigationLink {
            
        } label: {
            Text("Login")
        }
        .foregroundStyle(Color.accentColor)
        .font(.system(size: 18, weight: .bold))
        .padding(.horizontal, 24)
        .padding(.vertical, 16)
        .background(.white, in: .capsule)
    }
    
    var btnRegister: some View {
        NavigationLink {
            
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

#Preview {
    LoginPage()
}
