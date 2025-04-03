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
                .resize(imageSize)
                .background(Color.accentColor.opacity(0.5))
                .cornerRadius(15, antialiased: true)
                .scaledToFill()
            
            VStack(alignment: .leading, spacing: 7.5) {
                Text(item.name)
                    .foregroundStyle(Color.accentColor)
                    .font(.system(size: 24, weight: .semibold))
                
                Rectangle()
                    .foregroundStyle(.gray.opacity(0.2))
                    .frame(height: 1)
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 5)
                
                PrepTimeView(
                    item.preparationTimeFormatted,
                    direction: .leading,
                    textColor: .accentColor,
                    shadowColor: .clear
                )
                
                CookTimeView(
                    item.cookingTimeFormatted,
                    direction: .leading,
                    textColor: .accentColor,
                    shadowColor: .clear
                )
                
                ServesView(
                    "\(item.servings)",
                    direction: .leading,
                    textColor: .accentColor,
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
