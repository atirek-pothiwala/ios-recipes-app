//
//  TabPage.swift
//  recipes
//
//  Created by Atirek Pothiwala on 23/03/25.
//

import SwiftUI

struct TabPage: View {
    
    @EnvironmentObject var navigator: Navigator
    @State private var showLanguageDialog = false
        
    var body: some View {
        ZStack {
            VStack {
                ToolbarView {
                    withAnimation(.easeInOut) {
                        showLanguageDialog = true
                    }
                }
                
                TabView {
                    DiscoverPage()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .tabItem {
                            Label("dicover".localized, systemImage: "tornado")
                        }
                        .safeAreaPadding(.horizontal, 15)
                        .safeAreaPadding(.bottom, 15)
                    
                    RecipeListPage()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .tabItem {
                            Label("recipes".localized, systemImage: "fork.knife")
                        }
                        .safeAreaPadding(.horizontal, 15)
                        .safeAreaPadding(.bottom, 15)
                    
                    SettingsPage()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .tabItem {
                            Label("settings".localized, systemImage: "gear")
                        }
                        .safeAreaPadding(.horizontal, 15)
                        .safeAreaPadding(.bottom, 15)
                }
            }
            
            languageDialog
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationBarBackButtonHidden()
        .safeAreaPadding()
    }
    
    var languageDialog: some View {
        ZStack {
            if showLanguageDialog {
                ChangeLanguageSheet { isLanguageChanged in
                    showLanguageDialog = false
                    if isLanguageChanged {
                        navigator.reset()
                    }
                }
            }
        }
        .animation(.easeInOut, value: showLanguageDialog)
    }
}


#Preview {
    TabPage()
}
