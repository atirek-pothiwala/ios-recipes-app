//
//  RecipeListVM.swift
//  recipes
//
//  Created by Atirek Pothiwala on 31/03/25.
//


import Foundation

class RecipeDetailVM: ObservableObject {
    private let service = RecipeService()
    
    @Published var recipe: RecipeDetailModel?
    @Published var loading: Bool = false
    @Published var error: String = ""
        
    func fetch(_ id: Int, loader: Bool = true) {
        DispatchQueue.main.async {
            if loader {
                self.loading = true
            }
            self.error = ""
        }
        service.detail(id) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let recipe):
                    self?.recipe = recipe
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
