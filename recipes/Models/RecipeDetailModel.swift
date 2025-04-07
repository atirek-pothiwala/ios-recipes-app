//
//  Account.swift
//  recipes
//
//  Created by Atirek Pothiwala on 31/03/25.
//

import Foundation

struct RecipeDetailModel: Identifiable, Hashable, Codable {
    
    /*
        {
             "id": 13,
             "photo": "/uploads/recipes/1743708468598-692206557.jpg",
             "name": "Omelette",
             "description": "Omelettes are infinitely customizable! This recipe is perfect for busy weekdays, but below we offer a few variations that can be delicious when you have some more time to play around in the kitchen.",
             "chef": "Raju Bhai",
             "type": 1,
             "prepTime": 2,
             "cookTime": 4,
             "servings": 1,
             "createdAt": "2025-04-03T18:30:00.000Z",
             "ingredients": [
                 {
                     "id": 27,
                     "name": "Ingredients 1",
                     "quantity": "1",
                     "unit": "gm"
                 }
             ],
             "instructions": [
                 {
                     "id": 25,
                     "stepNumber": 1,
                     "description": "Instruction 1"
                 }
             ],
             "tips": [
                 {
                     "id": 36,
                     "description": "Tips 1"
                 }
             ]
         }
     */
    
    let id: Int
    let photo: String
    let name: String
    let description: String
    let chef: String
    let type: Int
    let preparationTime: Int
    let cookingTime: Int
    let servings: Int
    let createdAt: Date
    let ingredients: [IngredientModel]
    let instructions: [InstructionModel]
    let tips: [TipModel]
  
    var preparationTimeFormatted: String {
        return "\(preparationTime) mins"
    }
    
    var cookingTimeFormatted: String {
        return "\(cookingTime) mins"
    }

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case photo = "photo"
        case name = "name"
        case description = "description"
        case chef = "chef"
        case type = "type"
        case preparationTime = "prepTime"
        case cookingTime = "cookTime"
        case servings = "servings"
        case createdAt = "createdAt"
        case ingredients = "ingredients"
        case instructions = "instructions"
        case tips = "tips"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        photo = try values.decode(String.self, forKey: .photo)
        name = try values.decode(String.self, forKey: .name)
        description = try values.decode(String.self, forKey: .description)
        chef = try values.decode(String.self, forKey: .chef)
        type = try values.decode(Int.self, forKey: .type)
        preparationTime = try values.decode(Int.self, forKey: .preparationTime)
        cookingTime = try values.decode(Int.self, forKey: .cookingTime)
        servings = try values.decode(Int.self, forKey: .servings)
        
        let isoCreatedAt = try values.decode(String.self, forKey: .createdAt)
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        createdAt = isoDateFormatter.date(from: isoCreatedAt)!
        
        ingredients = try values.decode([IngredientModel].self, forKey: .ingredients)
        instructions = try values.decode([InstructionModel].self, forKey: .instructions)
        tips = try values.decode([TipModel].self, forKey: .tips)
    }

}
