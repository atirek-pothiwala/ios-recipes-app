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
    
    var validate: Bool {
        return !email.isEmpty && !password.isEmpty
    }
    
    @Published var loading: Bool = false
    @Published var token: String = ""
    @Published var error: String = ""
    
    func login(_ completion: @escaping () -> Void) {
        DispatchQueue.main.async {
            self.loading = true
            self.error = ""
        }
        let fields = LoginFields(email, password)
        service.login(fields) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let token):
                    Constants.shared.token = token
                    completion()
                case .failure(let error):
                    self?.error = error.localizedDescription
                }
                self?.loading = false
            }
        }
    }
}
