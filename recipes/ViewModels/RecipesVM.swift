//
//  RecipesVM.swift
//  recipes
//
//  Created by Atirek Pothiwala on 31/03/25.
//


import Foundation

class RecipesVM: ObservableObject {
    private let service = RecipeService()
    
    @Published var list: [RecipeModel] = []
    @Published var loading: Bool = false
    @Published var error: String = ""
        
    func fetch(loader: Bool = true) {
        if loader {
            self.loading = true
        }
        service.list { [weak self] result in
            DispatchQueue.main.async {
                if loader {
                    self?.loading = false
                }
                switch result {
                case .success(let list):
                    self?.list = list
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                    self?.error = error.localizedDescription
                }
            }
        }
    }
}
