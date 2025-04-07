//
//  CityVM.swift
//  recipes
//
//  Created by Atirek Pothiwala on 31/03/25.
//


import Foundation

class RegisterVM: ObservableObject {
    private let service = AccountService()
    
    @Published var firstName: String = "Atirek"
    @Published var lastName: String = "Pothiwala"
    @Published var email: String = "atirekpothiwala@recipes.com"
    @Published var password: String = "test@2025"
    @Published var confirmPassword: String = "test@2025"
    
    var validate: Bool {
        return !firstName.isEmpty
        && !lastName.isEmpty
        && !email.isEmpty
        && !password.isEmpty
        && !confirmPassword.isEmpty
        && password == confirmPassword
    }
    
    @Published var loading: Bool = false
    @Published var token: String = ""
    @Published var error: String = ""
    
    func register(_ completion: @escaping () -> Void) {
        DispatchQueue.main.async {
            self.loading = true
        }
        let fields = RegisterFields(firstName, lastName, email, password)
        service.register(fields) { [weak self] result in
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
