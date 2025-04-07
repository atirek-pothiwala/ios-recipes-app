//
//  RecipeListVM.swift
//  recipes
//
//  Created by Atirek Pothiwala on 31/03/25.
//


import Foundation

class FavouriteListVM: ObservableObject {
    private let service = RecipeService()
    
    @Published var list: [RecipeModel] = []
    @Published var loading: Bool = true
    @Published var error: String = ""
        
    func fetch(loader: Bool = true) {
        DispatchQueue.main.async {
            if loader {
                self.loading = true
            }
        }
        service.list { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let list):
                    self?.list = list
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
