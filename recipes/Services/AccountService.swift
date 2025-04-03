//
//  AccountService.swift
//  recipes
//
//  Created by Atirek Pothiwala on 31/03/25.
//

import Foundation

typealias LoginFields = (email: String, password: String)
typealias RegisterFields = (firstName: String, lastName: String, email: String, password: String)

class AccountService {
    func login(fields: LoginFields, _ completion: @escaping (Result<String, Error>) -> Void) {
        guard let url = URL(string: Constants.BASE_URL + Constants.LOGIN_URL) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 404, userInfo: nil)))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let jsonRequest: [String: Any] = [
            "email": fields.email,
            "password": fields.password
        ]
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: jsonRequest, options: [])
        } catch {
            completion(.failure(NSError(domain: "Bad Request", code: 400, userInfo: nil)))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard data != nil,
                  let token = String(data: data!, encoding: .utf8) else {
                completion(.failure(NSError(domain: "Data Not Found", code: 404, userInfo: nil)))
                return
            }
            completion(.success(token))
        }.resume()
    }
    
    func register(fields: RegisterFields, _ completion: @escaping (Result<String, Error>) -> Void) {
        guard let url = URL(string: Constants.BASE_URL + Constants.LOGIN_URL) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 404, userInfo: nil)))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let jsonRequest: [String: Any] = [
            "firstName": fields.firstName,
            "lastName": fields.lastName,
            "email": fields.email,
            "password": fields.password
        ]
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: jsonRequest, options: [])
        } catch {
            completion(.failure(NSError(domain: "Bad Request", code: 400, userInfo: nil)))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard data != nil,
                  let token = String(data: data!, encoding: .utf8) else {
                completion(.failure(NSError(domain: "Data Not Found", code: 404, userInfo: nil)))
                return
            }
            completion(.success(token))
        }.resume()
    }
}
