//
//  Account.swift
//  recipes
//
//  Created by Atirek Pothiwala on 31/03/25.
//

import Foundation

struct AccountModel: Codable {
    
    /*
        {
             "id": 1,
             "photo": null,
             "first_name": "Atirek",
             "last_name": "Pothiwala",
             "email": "atirekpothiwala@recipes.com",
             "created_at": "2025-03-29T18:30:00.000Z"
         }
     */
    
    let id : Int
    let photo: String?
    let firstName: String
    let lastName: String
    let email: String
    let createdAt: Date
  

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case photo = "photo"
        case firstName = "first_name"
        case lastName = "last_name"
        case email = "email"
        case createdAt = "created_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        photo = try values.decodeIfPresent(String.self, forKey: .photo)
        firstName = try values.decode(String.self, forKey: .firstName)
        lastName = try values.decode(String.self, forKey: .lastName)
        email = try values.decode(String.self, forKey: .email)
        
        let isoCreatedAt = try values.decode(String.self, forKey: .createdAt)
        
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        self.createdAt = isoDateFormatter.date(from: isoCreatedAt)!
    }

}
