//
//  NutritionModel.swift
//  recipes
//
//  Created by Atirek Pothiwala on 04/04/25.
//

import Foundation

struct NutritionModel: Identifiable, Hashable, Codable {
        
    let id: Int
    let calories: String
    let fat: String
    let saturatedFat: String
    let transFat: String
    let carbohydrate: String
    let fibre: String
    let sugar: String
    let protein: String
    let sodium: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case calories = "calories"
        case fat = "fat"
        case saturatedFat = "saturatedFat"
        case transFat = "transFat"
        case carbohydrate = "carbohydrate"
        case fibre = "fibre"
        case sugar = "sugar"
        case protein = "protein"
        case sodium = "sodium"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        calories = try values.decode(String.self, forKey: .calories)
        fat = try values.decode(String.self, forKey: .fat)
        saturatedFat = try values.decode(String.self, forKey: .saturatedFat)
        transFat = try values.decode(String.self, forKey: .transFat)
        carbohydrate = try values.decode(String.self, forKey: .carbohydrate)
        fibre = try values.decode(String.self, forKey: .fibre)
        sugar = try values.decode(String.self, forKey: .sugar)
        protein = try values.decode(String.self, forKey: .protein)
        sodium = try values.decode(String.self, forKey: .sodium)
    }

}
