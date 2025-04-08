//
//  RecipeCell.swift
//  recipes
//
//  Created by Atirek Pothiwala on 04/04/25.
//

import SwiftUI

struct RecipeCell: View {
    
    let item: RecipeModel
    let imageSize: CGSize
    
    init(_ item: RecipeModel, _ imageSize: CGSize) {
        self.item = item
        self.imageSize = imageSize
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            
            ImageView(url: item.photo)
                .scaledToFill()
                .resize(imageSize)
                .cornerRadius(15, antialiased: true)
            
            VStack(alignment: .leading, spacing: 7.5) {
                Text(item.name)
                    .foregroundStyle(Color.accent)
                    .font(.system(size: 24, weight: .semibold))
                
                Rectangle()
                    .foregroundStyle(.gray.opacity(0.2))
                    .frame(height: 1)
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 5)
                
                PrepTimeView(
                    item.preparationTimeFormatted,
                    direction: .leading,
                    textColor: .accent,
                    shadowColor: .clear
                )
                
                CookTimeView(
                    item.cookingTimeFormatted,
                    direction: .leading,
                    textColor: .accent,
                    shadowColor: .clear
                )
                
                ServesView(
                    "\(item.servings)",
                    direction: .leading,
                    textColor: .accent,
                    shadowColor: .clear
                )
            }
            .frame(
                maxWidth: .infinity,
                alignment: .leading
            )
        }
        .modifier(RecipeCellModifier())
    
    }
}
