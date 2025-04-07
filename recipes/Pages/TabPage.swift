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
            
            RecipeListPage()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .tabItem {
                    Label("Recipes", systemImage: "fork.knife")
                }
            
            SettingsPage()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
        .navigationBarBackButtonHidden()
        .safeAreaPadding()
    }
}


#Preview {
    TabPage()
}
