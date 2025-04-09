//
//  RootNavigator.swift
//  recipes
//
//  Created by Atirek Pothiwala on 04/04/25.
//

import SwiftUI

struct RootNavigator: View {
    
    @StateObject private var navigator = Navigator()
    @StateObject private var toastor = Toastor()

    var body: some View {
        NavigationStack(path: $navigator.path) {
            SplashPage()
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .splash:
                        SplashPage()
                    case .login:
                        LoginPage()
                    case .register:
                        RegisterPage()
                    case .forgotPassword:
                        ForgotPasswordPage()
                    case .dashboard:
                        TabPage()
                    case .recipeDetail(let recipe):
                        RecipeDetailPage(recipe: recipe)
                    case .favourites:
                        FavouriteListPage()
                    case .profilePage(let account):
                        ProfilePage(account: account)
                    }
                }
        }
        .environmentObject(navigator)
        .addEnvironmentToastor(toastor)
    }

}
