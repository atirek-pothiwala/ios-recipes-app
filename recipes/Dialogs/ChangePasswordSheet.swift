//
//  SheetDialogExample.swift
//  recipes
//
//  Created by Atirek Pothiwala on 07/04/25.
//

import SwiftUI

struct ChangePasswordSheet: View {
    
    @EnvironmentObject private var toastor: Toastor
    @StateObject private var viewModel = ChangePasswordVM()
    @FocusState private var focusedInput: Field?
    
    let onDismiss: () -> Void

    var body: some View {
        VStack(alignment: .trailing, spacing: 15) {
                        
            titleView
            
            tfPassword
            
            tfNewPassword
            
            Spacer()
            
            btnSubmit
        }
        .safeAreaPadding(.all, 24)
        .presentationDetents([.medium, .large])
        .presentationDragIndicator(.visible)
        .applyToast(toastor, viewModel.error, of: .error)
    }
    
    var titleView: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            Image(systemName: "lock.fill")
                .resizable()
                .scaledToFit()
                .foregroundStyle(Color.accent)
                .frame(width: 75, height: 75)
                .modifier(ShakeEffectModifier())
                .padding(.bottom, 15)
            
            Text("Change Password")
                .font(.system(size: 24, weight: .semibold))
                .foregroundStyle(Color.accent)
                .padding(.bottom, 5)
            
            Text("Set a new password for your account.")
                .font(.system(size: 16, weight: .regular))
                .foregroundStyle(Color.accent.opacity(0.5))
                .multilineTextAlignment(.center)
                .padding(.bottom, 15)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var tfPassword: some View {
        PasswordTextField(text: $viewModel.currentPassword, tint: .accent.opacity(0.5)) {
            Text("Current Password")
                .foregroundStyle(.accent.opacity(0.5))
        }
        .modifier(
            TextFieldModifier(
                textColor: .accent,
                hintColor: .accent,
                background: .accent.opacity(0.15)
            )
        )
        .focused($focusedInput, equals: .password)
        .keyboardType(.default)
        .textContentType(.password)
        .textInputAutocapitalization(.none)
        .submitLabel(.next)
        .onSubmit {
            focusedInput = .confirmPassword
        }
    }
    
    var tfNewPassword: some View {
        PasswordTextField(text: $viewModel.newPassword, tint: .accent.opacity(0.5)) {
            Text("New Password")
                .foregroundStyle(.accent.opacity(0.5))
        }
        .modifier(
            TextFieldModifier(
                textColor: .accent,
                hintColor: .accent,
                background: .accent.opacity(0.15)
            )
        )
        .focused($focusedInput, equals: .password)
        .keyboardType(.default)
        .textContentType(.password)
        .textInputAutocapitalization(.none)
        .submitLabel(.done)
        .onSubmit {
            focusedInput = .none
        }
    }
    
    var btnSubmit: some View {
        Button {
            viewModel.change {
                onDismiss()
            }
        } label: {
            Image(systemName: "chevron.right")
        }
        .foregroundStyle(Color.white)
        .font(.system(size: 18, weight: .bold))
        .padding(.all, 16)
        .background(.accent, in: .circle)
        .disabled(!viewModel.validate())
    }
}

private extension ChangePasswordSheet {
    enum Field: Int, Hashable, CaseIterable {
        case password
        case confirmPassword
    }
}

#Preview {
    ChangePasswordSheet {
        
    }
}
