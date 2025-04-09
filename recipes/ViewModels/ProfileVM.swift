//
//  SettingsVM.swift
//  recipes
//
//  Created by Atirek Pothiwala on 31/03/25.
//


import Foundation
import UIKit

class ProfileVM: ObservableObject {
    private let service = AccountService()
        
    @Published var loading: Bool = false
    @Published var error: String = ""
    @Published var pickedImage: UIImage?
        
    var validate: Bool {
        return pickedImage != nil
    }
    
    func upload(_ completion: @escaping () -> Void) {
        DispatchQueue.main.async {
            self.loading = true
            self.error = ""
        }
        service.upload(pickedImage!) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(_):
                    completion()
                case .failure(let error):
                    self?.error = error.localizedDescription
                }
                self?.loading = false
            }
        }
    }

}
