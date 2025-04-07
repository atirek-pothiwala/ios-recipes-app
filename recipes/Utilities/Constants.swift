//
//  Constants.swift
//  recipes
//
//  Created by Atirek Pothiwala on 27/03/25.
//

import UIKit

class Constants {
    
    static var shared: Constants = {
        return Constants()
    }()
    
    private init() {}

    static let IMAGE_BASE_URL: String = "http://localhost:3000"
    static let BASE_URL: String = "http://localhost:3000/api"
    
    static let LOGIN_URL: String = "/accounts/login"
    static let REGISTER_URL: String = "/accounts/register"
    static let PROFILE_ACCOUNT_URL: String = "/accounts/profile"
    static let CHANGE_PASSWORD_URL: String = "/accounts/changePassword"
    static let UPLOAD_URL: String = "/accounts/upload"
    static let DELETE_ACCOUNT_URL: String = "/accounts/delete"
    static let LIST_RECIPE_URL: String = "/recipes/list"
    static let DETAIL_RECIPE_URL: String = "/recipes/detail"

    
    var token: String {
        get {
            return UserDefaults.standard.string(forKey: "token") ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "token")
        }
    }
    
    var favourites: [Int] {
        get {
            return UserDefaults.standard.array(forKey: "favourites") as? [Int] ?? []
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "favourites")
        }
    }
        
    
    let variations: [VariationItem] = [
        VariationItem(
            "Western Omelette",
            "Spray skillet with cooking spray or heat 1 tsp (5 mL) vegetable oil in skillet. Add 1/4 cup (60 mL) finely chopped ham, 2 tbsp (30 mL) chopped sweet green pepper and 1 tbsp (15 mL) finely chopped onion; cook, stirring frequently, until vegetables are tender. Pour in egg mixture and cook as directed in the Basic Omelette recipe."
        ),
        VariationItem(
            "Fine Herbs Omelette",
            "Add 2 tbsp (30 mL) finely chopped parsley, 1 tsp (5 mL) finely chopped green onion, 1/2 tsp (2 mL) dried tarragon and 1/8 tsp (0.5 mL) finely chopped garlic to egg mixture in the Basic Omelette recipe. Cook as directed."
        ),
        VariationItem(
            "Mushroom and Spinach Omelette",
            "Filling ingredients: 3 tbsp (45 mL) each sauteed mushrooms, wilted spinach (or thawed and well-drained frozen spinach), sliced green onions, and shredded old Cheddar cheese."
        )
    ]
    
    let nutritionFacts: [NutritionFact] = [
        NutritionFact("Calories", "148 mg"),
        NutritionFact("Fat", "11 g"),
        NutritionFact("Saturated Fat", "3 g"),
        NutritionFact("Trans Fat", "0 g"),
        NutritionFact("Carbohydrate", "2 g"),
        NutritionFact("Fibre", "0 g"),
        NutritionFact("Sugars", "0 g"),
        NutritionFact("Protein", "12 g"),
        NutritionFact("Sodium", "207 mg"),
    ]
}
