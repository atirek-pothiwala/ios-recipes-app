//
//  Route.swift
//  recipes
//
//  Created by Atirek Pothiwala on 04/04/25.
//


enum Route: Hashable {
    case splash
    case login
    case register
    case dashboard
    case forgotPassword
    case recipeDetail(RecipeModel)
    case favourites
}
