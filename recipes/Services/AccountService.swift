//
//  AccountService.swift
//  recipes
//
//  Created by Atirek Pothiwala on 31/03/25.
//

import Foundation
import UIKit

typealias LoginFields = (email: String, password: String)
typealias RegisterFields = (firstName: String, lastName: String, email: String, password: String)
typealias ChangePasswordFields = (currentPassword: String, newPassword: String)

class AccountService {
    func login(_ fields: LoginFields, _ completion: @escaping (Result<String, Error>) -> Void) {
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
            
            guard let token = String(data: data!, encoding: .utf8) else {
                completion(.failure(NSError(domain: "Data Not Found", code: 404, userInfo: nil)))
                return
            }
            completion(.success(token))
            
        }.resume()
    }
    
    func register(_ fields: RegisterFields, _ completion: @escaping (Result<String, Error>) -> Void) {
        guard let url = URL(string: Constants.BASE_URL + Constants.REGISTER_URL) else {
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
            let httpResponse = response as! HTTPURLResponse
            guard httpResponse.statusCode == 201 else {
                if let dictionary = data?.convertToDictionary(),
                   let error = dictionary["error"] as? String {
                    completion(.failure(NSError(domain: error, code: httpResponse.statusCode, userInfo: nil)))
                } else {
                    completion(.failure(NSError(domain: "Unable to reach server", code: httpResponse.statusCode, userInfo: nil)))
                }
                return
            }
            
            guard let token = String(data: data!, encoding: .utf8) else {
                completion(.failure(NSError(domain: "Data Not Found", code: 404, userInfo: nil)))
                return
            }
            completion(.success(token))
            
        }.resume()
    }
    
    func profile(_ completion: @escaping (Result<AccountModel, Error>) -> Void) {
        guard let url = URL(string: Constants.BASE_URL + Constants.PROFILE_ACCOUNT_URL) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 404, userInfo: nil)))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
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
                let account = try decoder.decode(AccountModel.self, from: data!)
                completion(.success(account))
            } catch {
                completion(.failure(error))
            }
            
        }.resume()
    }
    
    func delete(_ password: String, _ completion: @escaping (Result<String?, Error>) -> Void) {
        guard let url = URL(string: Constants.BASE_URL + Constants.DELETE_ACCOUNT_URL) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 404, userInfo: nil)))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(Constants.shared.token)", forHTTPHeaderField: "Authorization")
        
        let jsonRequest: [String: Any] = [
            "password": password
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
            
            let httpResponse = response as! HTTPURLResponse
            guard httpResponse.statusCode == 204 else {
                if let dictionary = data?.convertToDictionary(),
                   let error = dictionary["error"] as? String {
                    completion(.failure(NSError(domain: error, code: httpResponse.statusCode, userInfo: nil)))
                } else {
                    completion(.failure(NSError(domain: "Unable to reach server", code: httpResponse.statusCode, userInfo: nil)))
                }
                return
            }
            completion(.success(nil))
            
        }.resume()
    }
    
    func changePassword(_ fields: ChangePasswordFields, _ completion: @escaping (Result<String?, Error>) -> Void) {
        guard let url = URL(string: Constants.BASE_URL + Constants.CHANGE_PASSWORD_URL) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 404, userInfo: nil)))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(Constants.shared.token)", forHTTPHeaderField: "Authorization")
        
        let jsonRequest: [String: Any] = [
            "currentPassword": fields.currentPassword,
            "newPassword": fields.newPassword
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
            
            let httpResponse = response as! HTTPURLResponse
            guard httpResponse.statusCode == 204 else {
                if let dictionary = data?.convertToDictionary(),
                   let error = dictionary["error"] as? String {
                    completion(.failure(NSError(domain: error, code: httpResponse.statusCode, userInfo: nil)))
                } else {
                    completion(.failure(NSError(domain: "Unable to reach server", code: httpResponse.statusCode, userInfo: nil)))
                }
                return
            }
            completion(.success(nil))
            
        }.resume()
    }
    
    func upload(_ image: UIImage, _ completion: @escaping (Result<String?, Error>) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.8) else {
            completion(.failure(NSError(domain: "Image Conversion Failure", code: -1, userInfo: nil)))
            return
        }
        
        guard let url = URL(string: Constants.BASE_URL + Constants.UPLOAD_URL) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 404, userInfo: nil)))
            return
        }
        

        // Generate boundary
        let boundary = UUID().uuidString
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(Constants.shared.token)", forHTTPHeaderField: "Authorization")

        // Build multipart body
        var body = Data()

        // Append image data
        body.append("--\(boundary)\r\n".data(using: .utf8)!)
        body.append("Content-Disposition: form-data; name=\"photo\"; filename=\"profile.jpg\"\r\n".data(using: .utf8)!)
        body.append("Content-Type: image/jpeg\r\n\r\n".data(using: .utf8)!)
        body.append(imageData)
        body.append("\r\n".data(using: .utf8)!)

        // End boundary
        body.append("--\(boundary)--\r\n".data(using: .utf8)!)
        request.httpBody = body
        
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
            completion(.success(nil))
            
        }.resume()
    }
}
