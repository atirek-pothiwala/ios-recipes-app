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
                    Label("Dicover", systemImage: "tornado")
                }
                .padding(.bottom, 0)
            
            RecipeListPage()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .tabItem {
                    Label("Recipes", systemImage: "fork.knife")
                }
                .padding(.bottom, 10)
            
            SettingsPage()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .tabItem {
                    Label("Settings", systemImage: "gear")
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
