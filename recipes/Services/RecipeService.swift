//
//  AccountService.swift
//  recipes
//
//  Created by Atirek Pothiwala on 31/03/25.
//

import Foundation

class RecipeService {
    func list(_ completion: @escaping (Result<[RecipeModel], Error>) -> Void) {
        guard let url = URL(string: Constants.BASE_URL + Constants.LIST_RECIPE_URL) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 404, userInfo: nil)))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(Constants.shared.token)", forHTTPHeaderField: "Authorization")
                
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "Data Not Found", code: 404, userInfo: nil)))
                return
            }

            do {
//                if let json = String(data: data, encoding: .utf8) {
//                    debugPrint(json)
//                }
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let list = try decoder.decode([RecipeModel].self, from: data)
                
                completion(.success(list))
            } catch let DecodingError.keyNotFound(key, context) {
                print("❌ Missing key: \(key.stringValue) - \(context.debugDescription)")
            } catch let DecodingError.typeMismatch(type, context) {
                print("❌ Type mismatch: \(type) - \(context.debugDescription)")
            } catch let DecodingError.valueNotFound(type, context) {
                print("❌ Missing value: \(type) - \(context.debugDescription)")
            } catch {
                completion(.failure(error))
            }
            
        }.resume()
    }

}
