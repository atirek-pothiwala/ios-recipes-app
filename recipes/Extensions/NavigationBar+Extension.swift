//
//  NavigationBar+Extension.swift
//  recipes
//
//  Created by Atirek Pothiwala on 28/03/25.
//

import UIKit

extension UINavigationBar {
    
    static func setDefaultTheme(color: UIColor = .white, background: UIColor = .accent) {
        let navAppearance = UINavigationBarAppearance()
        navAppearance.configureWithTransparentBackground()
        navAppearance.largeTitleTextAttributes = [.foregroundColor: color]
        navAppearance.titleTextAttributes = [.foregroundColor: color]
        navAppearance.backgroundColor = background

        UINavigationBar.appearance().standardAppearance = navAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navAppearance
    }
}
