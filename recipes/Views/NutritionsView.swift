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
            Text("Nutrition Facts")
                .frame(maxWidth: .infinity, alignment: .center)
                .font(.system(size: 20, weight: .semibold))
                .foregroundStyle(.black)
                .padding(.top, 5)
         
            VStack(spacing: 0) {
                headerView
                
                NutritionCell(item: ("Calories", item.calories))
                NutritionCell(item: ("Fat", item.fat))
                NutritionCell(item: ("Saturated Fat", item.saturatedFat))
                NutritionCell(item: ("Trans Fat", item.transFat))
                NutritionCell(item: ("Carbohydrate", item.carbohydrate))
                NutritionCell(item: ("Fibre", item.fibre))
                NutritionCell(item: ("Sugar", item.sugar))
                NutritionCell(item: ("Protein", item.protein))
                NutritionCell(item: ("Sodium", item.sodium), showDivider: false)
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
                Text("Per Servings")
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
