//
//  SettingsVM.swift
//  recipes
//
//  Created by Atirek Pothiwala on 31/03/25.
//


import Foundation

class DeleteAccountVM: ObservableObject {
    private let service = AccountService()
    
    @Published var password: String = ""
    @Published var swipe: SwipeActionView.SwipeAction = .none
    
    @Published var loading: Bool = true
    @Published var error: String = ""
        
    func delete() {
        service.delete(password) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(_):
                    self?.swipe = .completed
                case .failure(let error):
                    self?.error = error.localizedDescription
                    self?.swipe = .none
                }
            }
        }
    }
    
    func expireSession(){
        Constants.shared.token = ""
    }
}
