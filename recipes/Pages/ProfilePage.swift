//
//  ProfilePage.swift
//  recipes
//
//  Created by Atirek Pothiwala on 04/04/25.
//

import SwiftUI

struct ProfilePage: View {
    
    @EnvironmentObject var toastor: Toastor
    @EnvironmentObject var navigator: Navigator
    @State private var showImagePicker = false
    
    @StateObject private var viewModel = ProfileVM()
    let account: AccountModel
    
    var body: some View {
        VStack(alignment: .center) {
            profileView
            Spacer()
            btnPicker
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.accent)
        .modifier(NavigationBarModifier("profile_photo".localized) {
            navigator.pop()
        })
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                btnSubmit
            }
        }
        .applyToast(toastor, viewModel.error, of: .error)
        .safeAreaPadding(.bottom)
        .background {
            ImagePicker(selectedImage: $viewModel.pickedImage, isPresented: $showImagePicker)
        }
    }

    var profileView: some View {
        ZStack(alignment: .center) {
            Rectangle()
                .fill(Color.gray.opacity(0.5))
            
            if viewModel.loading {
                ProgressView("loading_profile".localized)
                    .tint(.white)
            } else {
                if let pickedImage = viewModel.pickedImage {
                    Image(uiImage: pickedImage)
                        .resizable()
                        .scaledToFill()
                } else if let photo = account.photo {
                    ImageView(url: photo)
                        .scaledToFill()
                } else {
                    Image("phAccount")
                        .resizable()
                        .scaledToFill()
                }
            }
        }
        .aspectRatio(1, contentMode: .fit)
        .ignoresSafeArea(.container, edges: .horizontal)
    }
    
    var btnPicker: some View {
        Button {
            showImagePicker = true
        } label: {
            Text("pick_photo".localized)
                .foregroundStyle(.white)
                .font(.system(size: 18, weight: .bold))
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 16)
        .background(.black, in: .capsule)
    }
    
    var btnSubmit: some View {
        Button {
            viewModel.upload {
                navigator.pop()
            }
        } label: {
            Text("submit".localized)
                .font(.system(size: 16, weight: .regular))
                .foregroundStyle(Color.white)
        }
    }
}

