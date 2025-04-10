//
//  InstructionsView.swift
//  recipes
//
//  Created by Atirek Pothiwala on 27/03/25.
//

import SwiftUI

struct NutritionsView: View {
    
    let item: NutritionModel
    
    init(_ item: NutritionModel) {
        self.item = item
    }
    
    var body: some View {
        VStack(spacing: 15) {
            Text("nutritions".localized)
                .frame(maxWidth: .infinity, alignment: .center)
                .font(.system(size: 20, weight: .semibold))
                .foregroundStyle(.black)
                .padding(.top, 5)
         
            VStack(spacing: 0) {
                headerView
                
                NutritionCell(item: ("calories".localized, item.calories))
                NutritionCell(item: ("fat".localized, item.fat))
                NutritionCell(item: ("saturated_fat".localized, item.saturatedFat))
                NutritionCell(item: ("trans_fat".localized, item.transFat))
                NutritionCell(item: ("carbohydrate".localized, item.carbohydrate))
                NutritionCell(item: ("fibre".localized, item.fibre))
                NutritionCell(item: ("sugar".localized, item.sugar))
                NutritionCell(item: ("protein".localized, item.protein))
                NutritionCell(item: ("sodium".localized, item.sodium), showDivider: false)
            }
            .cornerRadius(15, antialiased: true)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.gray.opacity(0.15), lineWidth: 1)
            )
        }
        .frame(maxWidth: .infinity)
        .padding(.all)
    }
    
    var headerView: some View {
        VStack(spacing: 0) {
            HStack(alignment: .center, spacing: 0) {
                Text("per_servings".localized)
                    .font(.system(size: 15, weight: .black))
                    .foregroundStyle(.black)
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .padding(.all, 20)
            
            Rectangle()
                .foregroundStyle(.gray.opacity(0.15))
                .frame(maxWidth: .infinity, maxHeight: 1)
        }
    }

}
