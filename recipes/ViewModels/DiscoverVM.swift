//
//  RecipeListVM.swift
//  recipes
//
//  Created by Atirek Pothiwala on 31/03/25.
//


import Foundation

class DiscoverVM: ObservableObject {
    private let service = RecipeService()
    
    @Published var list: [RecipeModel] = []
    @Published var loading: Bool = false
    @Published var error: String = ""
        
    func ignoreRecipe(at index: Int) {
        DispatchQueue.main.async {
            self.list.remove(at: index)
        }
    }
    
    func favouriteRecipe(at index: Int) {
        DispatchQueue.main.async {
            let recipe = self.list.remove(at: index)
            if !Constants.shared.favourites.contains(recipe.id) {
                Constants.shared.favourites.append(recipe.id)
            }
        }
    }
        
    func fetch(loader: Bool = true) {
        DispatchQueue.main.async {
            if loader {
                self.loading = true
            }
            self.error = ""
        }
        service.list { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let list):
                    let favourites = Constants.shared.favourites
                    self?.list = list.filter { !favourites.contains($0.id) }
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
