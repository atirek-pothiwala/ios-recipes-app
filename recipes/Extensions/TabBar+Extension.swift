//
//  TabBar+Extension.swift
//  recipes
//
//  Created by Atirek Pothiwala on 28/03/25.
//

import UIKit

extension UITabBar {
    static func setDefaultTheme() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithDefaultBackground()
        tabBarAppearance.backgroundColor = .white
        tabBarAppearance.shadowColor = .clear
        
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    }
}
