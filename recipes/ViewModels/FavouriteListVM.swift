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
    @Published var loading: Bool = false
    @Published var error: String = ""
        
    func fetch(loader: Bool = true) {
        let favourites = Constants.shared.favourites
        if favourites.isEmpty {
            return
        }
        DispatchQueue.main.async {
            if loader {
                self.loading = true
            }
            self.error = ""
        }
        
        service.filterList(favourites) { [weak self] result in
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
    
    func remove(atOffsets indexSet: IndexSet) {
        if let index = indexSet.first {
            let deletedItem = list[index]
            Constants.shared.favourites.removeAll { id in
                return deletedItem.id == id
            }
            self.list.remove(at: index)
        }
    }
}
