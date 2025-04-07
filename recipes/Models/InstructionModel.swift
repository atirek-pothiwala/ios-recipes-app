//
//  IngredientModel.swift
//  recipes
//
//  Created by Atirek Pothiwala on 04/04/25.
//

import Foundation

struct InstructionModel: Identifiable, Hashable, Codable {
    
    /*
         {
             "id": 25,
             "stepNumber": 1,
             "description": "Instruction 1"
         }
     */
    
    let id: Int
    let stepNumber: Int
    let description: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case stepNumber = "stepNumber"
        case description = "description"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        stepNumber = try values.decode(Int.self, forKey: .stepNumber)
        description = try values.decode(String.self, forKey: .description)
    }

}
