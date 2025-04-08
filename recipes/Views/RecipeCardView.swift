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
    
    @State private var direction: SwipeDirection = .normal
    
    var body: some View {
        ZStack(alignment: .bottomLeading, content: {
            ImageView(url: recipe.photo)
                .aspectRatio(ratio, contentMode: .fill)
            
            if direction == .left {
                nonFavouriteView
            } else if direction == .right {
                favouriteView
            }
            
            VStack(alignment: .leading, spacing: 10) {
                descriptionView
                
                Spacer()
                
                TitleView
            }
            .padding(.all)
                        
        })
        .aspectRatio(ratio, contentMode: .fit)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(radius: 2)
        .modifier(
            SwipeModifier(direction: $direction, onSwipe)
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
    
    var favouriteView: some View {
        ZStack(alignment: .topLeading) {
            Rectangle()
                .fill(
                    Gradient(
                        colors: [
                            Color.green.opacity(0.75),
                            Color.green.opacity(0.5),
                            Color.green.opacity(0.25),
                            Color.clear
                        ].reversed()
                    )
                )
            
            Text("😍")
                .font(.system(size: 75))
                .padding(.all, 25)
        }
    }
    
    var nonFavouriteView: some View {
        ZStack(alignment: .bottomTrailing) {
            Rectangle()
                .fill(
                    Gradient(
                        colors: [
                            Color.red.opacity(0.75),
                            Color.red.opacity(0.5),
                            Color.red.opacity(0.25),
                            Color.clear
                        ].reversed()
                    )
                )
            
            Text("😑")
                .font(.system(size: 75))
                .padding(.all, 25)
        }
    }
}
