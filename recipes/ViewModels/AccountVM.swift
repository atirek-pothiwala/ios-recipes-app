//
//  CityVM.swift
//  recipes
//
//  Created by Atirek Pothiwala on 31/03/25.
//


import Foundation

class AccountVM: ObservableObject {
    private let service = AccountService()
        
    func fetchAccounts() {
        service.fetch { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let accounts):
                    for account in accounts {
                        print("Account Email: \(account.email)")
                    }
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                    //self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
