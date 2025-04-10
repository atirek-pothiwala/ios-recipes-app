//
//  ForgotPasswordPage.swift
//  recipes
//
//  Created by Atirek Pothiwala on 23/03/25.
//

import SwiftUI

struct ForgotPasswordPage: View {
    
    @EnvironmentObject var navigator: Navigator
    @State private var email: String = ""
            
    var body: some View {
        VStack(alignment: .trailing, spacing: 15) {
                        
            Text("forgot_password_info".localized)
                .foregroundStyle(.white)
                .multilineTextAlignment(.leading)
                .font(.system(size: 18, weight: .regular))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            tfEmail
            btnSubmit
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.accent)
        .safeAreaPadding()
        .modifier(NavigationBarModifier("forgot_password".localized) {
            navigator.pop()
        })
    }
    
    var tfEmail: some View {
        TextField(text: $email) {
            Text("email_address".localized)
                .foregroundStyle(.white.opacity(0.25))
        }
        .modifier(TextFieldModifier.normal)
        .keyboardType(.emailAddress)
        .textContentType(.emailAddress)
        .textInputAutocapitalization(.never)
        .submitLabel(.done)
        .onSubmit {
            UIScreen.dismissKeyboard()
        }
    }
    
    var btnSubmit: some View {
        Button {
            
        } label: {
            Image(systemName: "chevron.right")
        }
        .foregroundStyle(Color.accent)
        .font(.system(size: 18, weight: .bold))
        .padding(.horizontal, 24)
        .padding(.vertical, 16)
        .background(.white, in: .circle)
    }
}
