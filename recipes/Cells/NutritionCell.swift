//
//  NutritionCell.swift
//  recipes
//
//  Created by Atirek Pothiwala on 09/04/25.
//

import SwiftUI

struct NutritionCell: View {
    
    let item: (title: String, servings: String)
    let showDivider: Bool
    
    init(item: (title: String, servings: String), showDivider: Bool = true) {
        self.item = item
        self.showDivider = showDivider
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .center, spacing: 0) {
                Text(item.title)
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundStyle(.black)
                Spacer()
                Text(item.servings)
                    .font(.system(size: 15, weight: .regular))
                    .foregroundStyle(.black)
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 20)
            .padding(.vertical, 15)
            
            if showDivider {
                Rectangle()
                    .foregroundStyle(.gray.opacity(0.15))
                    .frame(maxWidth: .infinity, maxHeight: 1)
            }
        }
    }
}
