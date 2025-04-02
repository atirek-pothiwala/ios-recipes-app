//
//  CityVM.swift
//  recipes
//
//  Created by Atirek Pothiwala on 31/03/25.
//


import Foundation

class CityVM: ObservableObject {
    private let service = CityService()
    
    @Published var search: String = "" {
        didSet {
            searchCities()
        }
    }
    @Published var cityList: [CityModel] = []
    @Published var filterListCity: [CityModel] = []
    @Published var searchCount: String = ""
    
    func searchCities() {
        if !search.isEmpty {
            filterListCity = cityList.filter {
                $0.name.lowercased().contains(search.lowercased())
            }
        } else {
            filterListCity = []
        }
        searchCount = "\(filterListCity.count)/\(cityList.count)"
    }
    
    func fetchCities() {
        cityList = service.fetchCities()
        debugPrint("City Count: \(cityList.count)")
    }
}