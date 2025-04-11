//
//  SettingsPage.swift
//  recipes
//
//  Created by Atirek Pothiwala on 28/03/25.
//

import SwiftUI

struct SettingsPage: View {
    
    @EnvironmentObject var toastor: Toastor
    @EnvironmentObject var navigator: Navigator
    @State private var colorEffectProgress: CGFloat = 0
    
    @StateObject private var viewModel = SettingsVM()

    @State private var showChangePasswordSheet = false
    @State private var showLogoutSheet = false
    @State private var showDeleteSheet = false
    
    var body: some View {
        ZStack {
            if viewModel.loading {
                ProgressView("loading_account".localized)
                    .tint(Color.accent)
            } else {
                ScrollView {
                    VStack(alignment: .leading) {
                        profile
                        listMenu
                            .padding(.top, 50)
                    }
                }
                .scrollIndicators(.never)
                .refreshable {
                    Task {
                        viewModel.fetch(loader: false)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .applyToast(toastor, viewModel.error, of: .error)
        .sheet(isPresented: $showChangePasswordSheet) {
            ChangePasswordSheet {
                showChangePasswordSheet = false
            }
            .addEnvironmentToastor(toastor)
        }
        .sheet(isPresented: $showLogoutSheet) {
            LogoutAccountSheet { isLoggedOut in
                showLogoutSheet = false
                if isLoggedOut {
                    Constants.shared.clear()
                    navigator.reset()
                }
            }
        }
        .sheet(isPresented: $showDeleteSheet) {
            DeleteAccountSheet { isAccountDeleted in
                showDeleteSheet = false
                Constants.shared.clear()
                navigator.reset()
            }
            .addEnvironmentToastor(toastor)
        }
        .onAppear {
            viewModel.fetch()
        }
    }
    
    var profile: some View {
        ZStack(alignment: .bottomLeading) {
            Rectangle()
                .fill(Color.gray.opacity(0.5))
            
            if viewModel.account == nil {
                Image("phAccount")
                    .resizable()
                    .scaledToFill()
            } else {
                if let photo = viewModel.account?.photo {
                    ImageView(url: photo)
                        .scaledToFill()
                } else {
                    Image("phAccount")
                        .resizable()
                        .scaledToFill()
                }
                
                VStack(alignment: .trailing) {
                    btnImagePicker
                    Spacer()
                    titleView
                }
            }
        }
        .aspectRatio(1, contentMode: .fit)
        .clipShape(UnevenRoundedRectangle(
            bottomTrailingRadius: 40
        ))
        .ignoresSafeArea()
    }
    
    var listMenu: some View {
        VStack(spacing: 20) {
            btnFavourites
            
            Divider()
                .ignoresSafeArea()
            
            btnChangePassword
            
            Divider()
                .ignoresSafeArea()
            
            btnLogout
            
            Divider()
                .ignoresSafeArea()
            
            btnDelete
                        
            
            Text("developedBy".localized)
                .font(.system(size: 16, weight: .regular))
                .foregroundStyle(Color.accent.opacity(0.5))
                .shadow(radius: 2)
                .padding(.vertical, 30)
                .padding(.horizontal, 15)
        }
    }
    
    var btnImagePicker: some View {
        Button {
            if let account = viewModel.account {
                navigator.push(Route.profilePage(account))
            }
        } label: {
            Image(systemName: "square.and.pencil.circle.fill")
                .font(.system(size: 40, weight: .bold))
                .foregroundStyle(.white)
                .shadow(radius: 5)
                .padding()
        }
    }
    
    var titleView: some View {
        VStack(alignment: .leading, spacing: 0) {
            let name = viewModel.account != nil ?
            "\(viewModel.account!.firstName) \(viewModel.account!.lastName)" : ""
            let email = viewModel.account?.email ?? ""
            
            Text(name)
                .font(.system(size: 32, weight: .bold))
                .foregroundStyle(Color.white)
            Text(verbatim: email)
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(Color.white)
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.all, 20)
        .background(
            Gradient(
                colors: [
                    Color.black.opacity(0.75),
                    Color.black.opacity(0.5),
                    Color.black.opacity(0.25),
                    Color.clear
                ].reversed()
            )
        )
    }
    
    var btnFavourites: some View {
        Button {
            navigator.push(Route.favourites)
        } label: {
            HStack(alignment: .top) {
                Image(systemName: "heart.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(Color.accent)
                    .padding(.all, 5)
                    .frame(width: 40, height: 40)
                    .modifier(BreathEffectModifier())
                    .padding(.trailing, 5)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("my_favourites".localized)
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundStyle(Color.accent)
                    
                    Text("my_favourites_info".localized)
                        .font(.system(size: 14, weight: .regular))
                        .foregroundStyle(Color.accent.opacity(0.5))
                        .multilineTextAlignment(.leading)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }

        
    }
    
    var btnChangePassword: some View {
        Button {
            withAnimation {
                showChangePasswordSheet = true
            }
        } label: {
            HStack(alignment: .top) {
                
                Image(systemName: "lock.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(Color.accent)
                    .padding(.all, 5)
                    .frame(width: 40, height: 40)
                    .modifier(ShakeEffectModifier())
                    .padding(.trailing, 5)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("change_password".localized)
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundStyle(Color.accent)
                    
                    Text("change_password_info".localized)
                        .font(.system(size: 14, weight: .regular))
                        .foregroundStyle(Color.accent.opacity(0.5))
                        .multilineTextAlignment(.leading)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }

        
    }
    
    var btnLogout: some View {
        Button {
            withAnimation {
                showLogoutSheet = true
            }
        } label: {
            HStack(alignment: .top) {
                
                Image(systemName: "power.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .padding(.all, 5)
                    .frame(width: 40, height: 40)
                    .padding(.trailing, 5)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("logout_account".localized)
                        .font(.system(size: 20, weight: .semibold))
                    
                    Text("logout_account_info".localized)
                        .font(.system(size: 14, weight: .regular))
                        .opacity(0.5)
                        .multilineTextAlignment(.leading)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    var btnDelete: some View {
        Button {
            withAnimation {
                showDeleteSheet = true
            }
        } label: {
            HStack(alignment: .top) {
                
                Image(systemName: "trash.fill")
                    .resizable()
                    .scaledToFit()
                    .padding(.all, 5)
                    .frame(width: 40, height: 40)
                    .padding(.trailing, 5)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("delete_account".localized)
                        .font(.system(size: 20, weight: .semibold))
                    
                    Text("delete_account_info".localized)
                        .font(.system(size: 14, weight: .regular))
                        .opacity(0.5)
                        .multilineTextAlignment(.leading)
                }
            }
            .applyColorEffect(progress: $colorEffectProgress, from: .accent, to: .red)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    SettingsPage()
}
