//
//  RecipeCardView.swift
//  recipes
//
//  Created by Atirek Pothiwala on 28/03/25.
//

import SwiftUI

struct RecipeCardView: View {
    
    let ratio: CGFloat = 3/5
    let recipe: RecipeModel
    let onSwipe: OnSwipe
    
    @State private var color: Color = .clear
    
    var body: some View {
        ZStack(alignment: .bottomLeading, content: {
            ImageView(url: recipe.photo)
                .aspectRatio(ratio, contentMode: .fill)
            
            VStack(alignment: .leading, spacing: 10) {
                descriptionView
                
                Spacer()
                
                TitleView
            }
            .padding(.all)
            
            Rectangle()
                .fill(color)
        })
        .aspectRatio(ratio, contentMode: .fit)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(radius: 2)
        .modifier(
            SwipeModifier(color: $color, onSwipe)
        )
    }
    
    var TitleView: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(recipe.name)
                .foregroundStyle(.white)
                .font(.system(size: 20, weight: .bold))
            
            Text("By \(recipe.chef)")
                .foregroundStyle(.white)
                .font(.system(size: 16, weight: .semibold))
        }
        .shadow(color: .black, radius: 10)
    }
    
    var descriptionView: some View {
        HStack {
            Spacer()
            VStack(alignment: .trailing, spacing: 10) {
                PrepTimeView(recipe.preparationTimeFormatted)
                CookTimeView(recipe.cookingTimeFormatted)
                ServesView("\(recipe.servings)")
            }
        }
    }
    
}
