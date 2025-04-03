//
//  CityVM.swift
//  recipes
//
//  Created by Atirek Pothiwala on 31/03/25.
//


import Foundation

class LoginVM: ObservableObject {
    private let service = AccountService()
    
    @Published var email: String = "atirekpothiwala@recipes.com"
    @Published var password: String = "test@2025"
    @Published var token: String = ""
    @Published var error: String = ""
    
    func login(_ completion: @escaping () -> Void) {
        service.login(fields: (email, password)) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let token):
                    print("Token: \(token)")
                    completion()
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                    self?.error = error.localizedDescription
                }
            }
        }
    }
}
