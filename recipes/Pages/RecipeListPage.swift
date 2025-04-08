//
//  RecipeListPage.swift
//  recipes
//
//  Created by Atirek Pothiwala on 28/03/25.
//

import SwiftUI

struct RecipeListPage: View {
    
    @EnvironmentObject var toastor: Toastor
    @EnvironmentObject var navigator: Navigator
    
    @StateObject private var viewModel = RecipeListVM()
    @State var imageSize: CGSize = .zero
        
    var body: some View {
        VStack(alignment: .leading) {
            ToolbarView {
                print("Open Filter")
            }
            if viewModel.loading {
                ProgressView("Loading Recipes")
                    .tint(Color.accent)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .onAppear {
                        viewModel.fetch()
                    }
            } else if !viewModel.list.isEmpty {
                List($viewModel.list, id: \.id) { $item in
                    RecipeCell(item, imageSize)
                        .onTapGesture {
                            navigator.push(Route.recipeDetail(item))
                        }
                }
                .listRowSpacing(15)
                .scrollContentBackground(.hidden)
                .scrollIndicators(.never)
                .listStyle(.plain)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(.container, edges: .horizontal)
                .refreshable {
                    Task {
                        viewModel.fetch(loader: false)
                    }
                }
                .renderSize(ratio: CGSize(width: 0.25, height: 0.4)) {
                    size in
                    imageSize = size
                }
            } else {
                NoDataView {
                    viewModel.fetch()
                }
            }
        }
        .applyToast(toastor, viewModel.error, of: .error)
        .safeAreaPadding()
    }
}

#Preview {
    RecipeListPage()
}
