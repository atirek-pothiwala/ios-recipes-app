//
//  RecipeModel.swift
//  recipes
//
//  Created by Atirek Pothiwala on 31/03/25.
//

import Foundation

struct RecipeModel: Identifiable, Hashable, Codable {
    
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
             "createdAt": "2025-04-03T18:30:00.000Z"
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
    }

}
