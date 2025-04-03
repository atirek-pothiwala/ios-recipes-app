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
    
    static let BASE_URL: String = "http://localhost:3000/api/"
    static let LOGIN_URL: String = "accounts/login"
    static let REGISTER_URL: String = "accounts/register"
    static let PROFILE_URL: String = "accounts/profile"
    static let UPLOAD_URL: String = "accounts/upload"
    
    
    let description: String = "Omelettes are infinitely customizable! This recipe is perfect for busy weekdays, but below we offer a few variations that can be delicious when you have some more time to play around in the kitchen."
    
    let ingredients: [String] = [
        "2 eggs",
        "1 tbsp (15 mL) water",
        "Pinch salt",
        "Pinch pepper",
        "1 tbsp (15 mL) butter or oil",
        "Filling ingredients"
    ]
    
    let instructions: [String] = [
        "Whisk eggs, water, salt and pepper.",
        "Melt butter in an 8-inch (20 cm) nonstick frying pan over medium heat. Pour in egg mixture. As eggs set around edge of pan, with spatula, gently push cooked portions toward centre of skillet. Tilt and rotate skillet to allow uncooked egg to flow into empty spaces.",
        "When eggs are almost set on surface but still look moist, cover half of omelette with filling. Slip spatula under unfilled side; fold over onto filled half.",
        "Cook for a minute, then slide omelette onto plate."
    ]
    
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
    
    let tips: [String] = [
        "Nutrition facts are based on a 2 egg omelette without filling.",
        "Using the proper skillet or pan is important to successful omelette making. The ideal skillet for a 1, 2 or 3-egg omelette is about 8 inches (20 cm) in diameter at the base. It should be shallow with sloping sides to make it easier to slide the omelette out of the skillet and onto a plate.",
        "An omelette can be made quickly and easier if the skillet is hot when the egg mixture is added. The skillet is hot enough when a drop of water rolls around instead of bursting into steam immediately.",
        "Preparing individual omelettes, rather than one large one, will result in lighter and fluffier omelettes that are easier to handle.",
        "The Perfect Omelette recipe can be multiplied for as many servings as you need. Use 1/2 cup (125 mL) of egg mixture for each 2-egg omelette and 3/4 cup (175 mL) for a 3-egg omelette.",
        "The fewer eggs, the quicker it will cook, so you can use a smaller skillet for a one- or two-egg omelette and one that measures 8-inches (20 cm) at the base for a 3-egg omelette.",
        "You can use cooking spray in place of the butter or oil.",
        "Covering the folded omelette and cooking for an extra minute helps to heat up the filling, melt any cheese, and finish cooking any remaining undercooked egg. This step is optional if your filling doesn’t require heating and the egg already appears cooked to your liking."
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
    
    let recipes: [RecipeItem] = [
        RecipeItem("Burger", "burger", "10-15 mins", "8-12 mins", 1),
        RecipeItem("Espresso", "coffee", "2-3 mins", "30 sec", 1),
        RecipeItem("Frankie", "frankie", "10-15 mins", "10-15 mins", 1),
        RecipeItem("French Fries", "french-fries", "10-15 mins", "10-12 mins", 2),
        RecipeItem("Omelette", "omelette", "2 mins", "4 mins", 1),
        RecipeItem("Pav Bhaji", "pav-bhaji", "15-20 mins", "20-25 mins", 3),
        RecipeItem("Vada Pav", "vada-pav", "15-20 mins", "15-20 mins", 1)
    ]

}
