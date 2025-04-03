//
//  IngredientModel.swift
//  recipes
//
//  Created by Atirek Pothiwala on 04/04/25.
//

import Foundation

struct IngredientModel: Identifiable, Codable {
    
    /*
         {
             "id": 27,
             "name": "Ingredients 1",
             "quantity": 1,
             "unit": "gm"
         }
     */
    
    let id: Int
    let name: String
    let quantity: Int
    let unit: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case quantity = "quantity"
        case unit = "unit"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        quantity = try values.decode(Int.self, forKey: .quantity)
        unit = try values.decode(String.self, forKey: .unit)
    }

}
