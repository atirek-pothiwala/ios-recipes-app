//
//  ContentView.swift
//  recipes
//
//  Created by Atirek Pothiwala on 22/03/25.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UINavigationBar.setDefaultTheme()
        UITabBar.setDefaultTheme()
    }
    
    var body: some View {
        SplashPage()
     }
}

#Preview {
    ContentView()
}
