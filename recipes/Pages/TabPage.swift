//
//  TabPage.swift
//  recipes
//
//  Created by Atirek Pothiwala on 23/03/25.
//

import SwiftUI

struct TabPage: View {
        
    var body: some View {
        TabView {
            DiscoverPage()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .tabItem {
                    Label("dicover".localized, systemImage: "tornado")
                }
                .padding(.bottom, 0)
            
            RecipeListPage()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .tabItem {
                    Label("recipes".localized, systemImage: "fork.knife")
                }
                .padding(.bottom, 10)
            
            SettingsPage()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .tabItem {
                    Label("settings".localized, systemImage: "gear")
                }
                .padding(.bottom, 10)
        }
        .navigationBarBackButtonHidden()
        .safeAreaPadding()
    }
}


#Preview {
    TabPage()
}
