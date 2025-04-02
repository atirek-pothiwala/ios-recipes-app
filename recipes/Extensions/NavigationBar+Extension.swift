//
//  NavigationBar+Extension.swift
//  recipes
//
//  Created by Atirek Pothiwala on 28/03/25.
//

import UIKit

extension UINavigationBar {
    
    static func setDefaultTheme() {
        let navAppearance = UINavigationBarAppearance()
        navAppearance.configureWithTransparentBackground()
        navAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        //navAppearance.backgroundColor = UIColor.white

        UINavigationBar.appearance().standardAppearance = navAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navAppearance
    }
}
