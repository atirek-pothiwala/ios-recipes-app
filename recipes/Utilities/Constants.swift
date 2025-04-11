//
//  Constants.swift
//  recipes
//
//  Created by Atirek Pothiwala on 27/03/25.
//

import UIKit

class Constants {
    
    static var shared: Constants = {
        return Constants()
    }()
    
    private init() {}

    static let BASE_URL: String = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as! String
    
    static let API_URL : String = "\(BASE_URL)/api"
    static let IMAGE_URL : String = "\(BASE_URL)/uploads"
    
    static let LOGIN_URL: String = "/accounts/login"
    static let REGISTER_URL: String = "/accounts/register"
    static let PROFILE_ACCOUNT_URL: String = "/accounts/profile"
    static let CHANGE_PASSWORD_URL: String = "/accounts/changePassword"
    static let UPLOAD_URL: String = "/accounts/upload"
    static let DELETE_ACCOUNT_URL: String = "/accounts/delete"
    static let LIST_RECIPE_URL: String = "/recipes/list"
    static let FILTER_LIST_RECIPE_URL: String = "/recipes/filterList"
    static let DETAIL_RECIPE_URL: String = "/recipes/detail"
    
    var token: String {
        get {
            return UserDefaults.standard.string(forKey: "token") ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "token")
        }
    }
    
    var favourites: [Int] {
        get {
            return UserDefaults.standard.array(forKey: "favourites") as? [Int] ?? []
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "favourites")
        }
    }
    
    var language: String {
        get {
            return UserDefaults.standard.string(forKey: "language") ?? "English"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "language")
        }
    }

    func clear() {
        token = ""
        favourites = []
    }
    
}
