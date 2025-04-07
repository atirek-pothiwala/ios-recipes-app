//
//  SettingsVM.swift
//  recipes
//
//  Created by Atirek Pothiwala on 31/03/25.
//


import Foundation

class ChangePasswordVM: ObservableObject {
    private let service = AccountService()
    
    @Published var currentPassword: String = ""
    @Published var newPassword: String = ""
    
    @Published var loading: Bool = false
    @Published var error: String = ""
        
    func validate() -> Bool {
        return !currentPassword.isEmpty
        && !newPassword.isEmpty
        && currentPassword != newPassword
    }
    
    func change(_ completion: @escaping () -> Void) {
        DispatchQueue.main.async {
            self.loading = true
        }
        let fields = ChangePasswordFields(currentPassword, newPassword)
        service.changePassword(fields) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(_):
                    completion()
                case .failure(let error):
                    debugPrint(error.localizedDescription)
                    self?.error = error.localizedDescription
                }
                self?.loading = false
            }
        }
    }
}
