//
//  Account.swift
//  recipes
//
//  Created by Atirek Pothiwala on 31/03/25.
//

struct AccountModel: Codable {
    let id : Int?
  

    enum CodingKeys: String, CodingKey {
        case latitude = "latitude"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        latitude = try values.decodeIfPresent(Double.self, forKey: .latitude)
    }

}
