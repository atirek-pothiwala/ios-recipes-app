//
//  RecipeDetailPage.swift
//  recipes
//
//  Created by Atirek Pothiwala on 04/04/25.
//

import SwiftUI

struct RecipeDetailPage: View {

    let recipe: RecipeModel
    
    @EnvironmentObject var toastor: Toastor
    @EnvironmentObject var navigator: Navigator
    
    @StateObject private var viewModel = RecipeDetailVM()
    
    var body: some View {
        ZStack(alignment: .center) {
            if viewModel.loading {
                ProgressView("loading_recipe".localized)
                    .tint(.white)
            } else if viewModel.recipe != nil {
                ScrollView(.vertical) {
                    VStack(alignment: .leading, spacing: 0) {
                        PhotoView
                        DescriptionView
                        if let ingredients = viewModel.recipe?.ingredients, !ingredients.isEmpty {
                            IngredientsView(ingredients)
                        }
                        if let instructions = viewModel.recipe?.instructions, !instructions.isEmpty {
                            InstructionsView(instructions)
                        }
                        if let variations = viewModel.recipe?.variations, !variations.isEmpty {
                            VariationsView(variations)
                        }
                        if let tips = viewModel.recipe?.tips, !tips.isEmpty {
                            TipsView(tips)
                        }
                        if let nutritions = viewModel.recipe?.nutritions.first {
                            NutritionsView(nutritions)
                        }
                    }
                }
                .scrollIndicators(.never)
                .refreshable {
                    Task {
                        viewModel.fetch(recipe.id, loader: false)
                    }
                }
            } else {
                NoDataView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .modifier(NavigationBarModifier(recipe.name) {
            navigator.pop()
        })
        .applyToast(toastor, viewModel.error, of: .error)
        .safeAreaPadding(.bottom)
        .onAppear {
            viewModel.fetch(recipe.id)
        }
    }
    
    var TitleView: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(viewModel.recipe!.name)
                .foregroundStyle(.white)
                .font(.system(size: 20, weight: .bold))
            
            Text(String.init(format: "by".localized, viewModel.recipe!.chef))
                .foregroundStyle(.white)
                .font(.system(size: 16, weight: .semibold))
        }
        .shadow(color: .black, radius: 10)
    }
    
    var PhotoView: some View {
        ZStack(alignment: .bottomLeading, content: {
            ImageView(url: viewModel.recipe!.photo)
                .aspectRatio(3/4, contentMode: .fit)
                .frame(maxWidth: .infinity)
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Spacer()
                    VStack(alignment: .trailing, spacing: 10) {
                        PrepTimeView(viewModel.recipe!.preparationTimeFormatted)
                        CookTimeView(viewModel.recipe!.cookingTimeFormatted)
                        ServesView("\(viewModel.recipe!.servings)")
                    }
                }
                
                Spacer()
                
                TitleView
            }
            .padding(.all)
        })
    }
    
    var DescriptionView: some View {
        Text(viewModel.recipe!.description)
            .frame(maxWidth: .infinity, alignment: .center)
            .font(.system(size: 16, weight: .regular))
            .padding(.all)
    }
}

//#Preview {
//    RecipeDetailPage(recipe: nil)
//}
