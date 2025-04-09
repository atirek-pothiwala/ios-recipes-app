//
//  SettingsVM.swift
//  recipes
//
//  Created by Atirek Pothiwala on 31/03/25.
//


import Foundation
import UIKit

class SettingsVM: ObservableObject {
    private let service = AccountService()
    
    @Published var account: AccountModel?
    @Published var loading: Bool = true
    @Published var error: String = ""
    @Published var swipe: SwipeActionView.SwipeAction = .none
        
    func fetch(loader: Bool = true) {
        DispatchQueue.main.async {
            if loader {
                self.loading = true
            }
            self.error = ""
        }
        service.profile { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let account):
                    self?.account = account
                case .failure(let error):
                    self?.error = error.localizedDescription
                }
                if loader {
                    self?.loading = false
                }
            }
        }
    }

}
