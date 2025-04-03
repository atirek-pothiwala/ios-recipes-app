//
//  IngredientModel.swift
//  recipes
//
//  Created by Atirek Pothiwala on 04/04/25.
//

import Foundation

struct TipModel: Identifiable, Codable {
    
    /*
         {
             "id": 25,
             "description": "Instruction 1"
         }
     */
    
    let id: Int
    let description: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case description = "description"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        description = try values.decode(String.self, forKey: .description)
    }

}
