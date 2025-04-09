//
//  RecipeDetailPage.swift
//  recipes
//
//  Created by Atirek Pothiwala on 04/04/25.
//

import SwiftUI

struct ProfilePage: View {
    
    @EnvironmentObject var toastor: Toastor
    @EnvironmentObject var navigator: Navigator
    
    @State private var showImagePicker = false
    
    var body: some View {
        ZStack(alignment: .center) {
            ProgressView("Loading Profile")
                .tint(.white)
                .onAppear {
                    
                }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .modifier(NavigationBarModifier("Profile Photo") {
            navigator.pop()
        })
        .applyToast(toastor, "", of: .error)
        .safeAreaPadding(.bottom)
        .background {
            ImagePicker(selectedImage: $viewModel.pickedImage, isPresented: $showImagePicker)
        }
    }
    
}

#Preview {
    ProfilePage()
}
