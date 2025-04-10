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
    @StateObject private var network = Network()

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
        .environmentObject(network)
        .environmentObject(navigator)
        .addEnvironmentToastor(toastor)
        .onChange(of: network.isConnected, { oldValue, newValue in
            if newValue {
                toastor.show("internet_yes".localized, .success)
            } else {
                toastor.show("internet_no".localized, .error)
            }
        })
        .onAppear {
            network.monitorInternet()
        }
    }

}
