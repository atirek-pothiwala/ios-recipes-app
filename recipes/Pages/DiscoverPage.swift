//
//  DiscoverPage.swift
//  recipes
//
//  Created by Atirek Pothiwala on 28/03/25.
//

import SwiftUI

struct DiscoverPage: View {

    @EnvironmentObject var navigator: Navigator
    @EnvironmentObject var toastor: Toastor
    
    @StateObject private var viewModel = DiscoverVM()
    
    var body: some View {
        VStack(alignment: .leading) {
            ToolbarView()
            ZStack(alignment: .center) {
                if viewModel.loading {
                    ProgressView("Discovering Recipes")
                        .tint(Color.accent)
                        .onAppear {
                            viewModel.fetch()
                        }
                } else if !viewModel.list.isEmpty {
                    ForEach(viewModel.list.indices.reversed(), id: \.self) { index in
                        let item = viewModel.list[index]
                        RecipeCardView(recipe: item) { direction in
                            if direction == .left {
                                viewModel.ignoreRecipe(at: index)
                            } else {
                                viewModel.favouriteRecipe(at: index)
                            }
                        }
                        .onTapGesture {
                            navigator.push(Route.recipeDetail(item))
                        }
                        .zIndex(Double(index))
                    }
                } else {
                    NoDataView {
                        viewModel.fetch()
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .applyToast(toastor, viewModel.error, of: .error)
        .safeAreaPadding()
    }
}

#Preview {
    DiscoverPage()
}
