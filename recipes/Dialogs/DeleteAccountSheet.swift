//
//  SheetDialogExample.swift
//  recipes
//
//  Created by Atirek Pothiwala on 07/04/25.
//

import SwiftUI

struct DeleteAccountSheet: View {
    
    @EnvironmentObject private var toastor: Toastor
    @StateObject private var viewModel = DeleteAccountVM()
    @FocusState private var focusedInput: Field?
    
    let onDismiss: (_ isAccountDeleted: Bool) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
                    
            titleView
            
            tfPassword
            
            Spacer()
            
            btnDelete
            
            Text("Think it through — this action can't be undone.")
                .frame(maxWidth: .infinity, alignment: .center)
                .font(.system(size: 14, weight: .regular))
                .foregroundStyle(Color.gray)
                .multilineTextAlignment(.center)
                .padding(.top, 10)
        }
        .safeAreaPadding(.all, 24)
        .presentationDetents([.medium, .large])
        .presentationDragIndicator(.visible)
        .applyToast(toastor, viewModel.error, of: .error)
    }
    
    var titleView: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image(systemName: "trash.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 75, height: 75)
                .foregroundStyle(Color.accent)
                .padding(.bottom, 15)
            
            Text("We're sad to see you go!")
                .font(.system(size: 24, weight: .semibold))
                .foregroundStyle(Color.accent)
                .padding(.bottom, 5)
            
            Text("Deleting your account will erase all your data.")
                .font(.system(size: 16, weight: .regular))
                .foregroundStyle(Color.accent.opacity(0.5))
                .multilineTextAlignment(.center)
                .padding(.bottom, 15)
        }
    }
    
    var tfPassword: some View {
        PasswordTextField(text: $viewModel.password, tint: .accent.opacity(0.5)) {
            Text("Password")
                .foregroundStyle(.accent.opacity(0.5))
        }
        .modifier(
            TextFieldModifier.accent
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
    
    var btnDelete: some View {
        SwipeActionView(
            swipe: $viewModel.swipe,
            defaultText: "Swipe to Delete Account",
            progressText: "Processing",
            completeText: "Account Deleted") { action in
                if action == .progress {
                    viewModel.delete()
                } else if action == .completed {
                    onDismiss(true)
                }
            }
            .disabled(!viewModel.validate())
    }
}

private extension DeleteAccountSheet {
    enum Field: Int, Hashable, CaseIterable {
        case password
    }
}

#Preview {
    DeleteAccountSheet { isAccountDeleted in
        
    }
}
