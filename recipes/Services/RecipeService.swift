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
            let httpResponse = response as! HTTPURLResponse
            guard httpResponse.statusCode == 200 else {
                if let dictionary = data?.convertToDictionary(),
                   let error = dictionary["error"] as? String {
                    completion(.failure(NSError(domain: error, code: httpResponse.statusCode, userInfo: nil)))
                } else {
                    completion(.failure(NSError(domain: "Unable to reach server", code: httpResponse.statusCode, userInfo: nil)))
                }
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let list = try decoder.decode([RecipeModel].self, from: data!)
                
                completion(.success(list))
            } catch {
                completion(.failure(error))
            }
            
        }.resume()
    }
    
    func detail(_ id: Int, _ completion: @escaping (Result<RecipeDetailModel, Error>) -> Void) {
        guard var url = URL(string: Constants.BASE_URL + Constants.DETAIL_RECIPE_URL) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 404, userInfo: nil)))
            return
        }
        url = url.appending(queryItems: [
            URLQueryItem(name: "id", value: "\(id)")
        ])
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(Constants.shared.token)", forHTTPHeaderField: "Authorization")
        
                
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            let httpResponse = response as! HTTPURLResponse
            guard httpResponse.statusCode == 200 else {
                if let dictionary = data?.convertToDictionary(),
                   let error = dictionary["error"] as? String {
                    completion(.failure(NSError(domain: error, code: httpResponse.statusCode, userInfo: nil)))
                } else {
                    completion(.failure(NSError(domain: "Unable to reach server", code: httpResponse.statusCode, userInfo: nil)))
                }
                return
            }
                        
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let recipe = try decoder.decode(RecipeDetailModel.self, from: data!)
                completion(.success(recipe))
            } catch {
                completion(.failure(error))
            }
            
        }.resume()
    }
    
    func filterList(_ ids: [Int], _ completion: @escaping (Result<[RecipeModel], Error>) -> Void) {
        guard var url = URL(string: Constants.BASE_URL + Constants.FILTER_LIST_RECIPE_URL) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 404, userInfo: nil)))
            return
        }
        
        let commaSeparatedIds = ids.map { String($0) }.joined(separator: ",")
        url = url.appending(queryItems: [
            URLQueryItem(name: "ids", value: commaSeparatedIds)
        ])
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(Constants.shared.token)", forHTTPHeaderField: "Authorization")
                        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            let httpResponse = response as! HTTPURLResponse
            guard httpResponse.statusCode == 200 else {
                if let dictionary = data?.convertToDictionary(),
                   let error = dictionary["error"] as? String {
                    completion(.failure(NSError(domain: error, code: httpResponse.statusCode, userInfo: nil)))
                } else {
                    completion(.failure(NSError(domain: "Unable to reach server", code: httpResponse.statusCode, userInfo: nil)))
                }
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let list = try decoder.decode([RecipeModel].self, from: data!)
                
                completion(.success(list))
            } catch {
                completion(.failure(error))
            }
            
        }.resume()
    }
}
