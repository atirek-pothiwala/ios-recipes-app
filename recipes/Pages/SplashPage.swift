//
//  SplashPage.swift
//  recipes
//
//  Created by Atirek Pothiwala on 22/03/25.
//

import SwiftUI

struct SplashPage: View {
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                LogoView()
                
                Spacer()
                
                btnGetStarted
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.accentColor)
            .safeAreaPadding()
        }
    }
    
    var btnGetStarted: some View {
        NavigationLink {
            LoginView()
        } label: {
            Text("Get Started")
        }
        .foregroundStyle(Color.accentColor)
        .font(.system(size: 18, weight: .bold))
        .padding(.vertical, 16)
        .padding(.horizontal, 24)
        .background(.white, in: .capsule)
    }
}

#Preview {
    SplashPage()
}
