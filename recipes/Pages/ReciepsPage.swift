//
//  ReciepsPage.swift
//  recipes
//
//  Created by Atirek Pothiwala on 28/03/25.
//

import SwiftUI

struct ReciepsPage: View {
    
    @StateObject private var viewModel = RecipesVM()
    @State var imageSize: CGSize = .zero
        
    var body: some View {
        VStack(alignment: .leading) {
            ToolbarView {
                print("Open Filter")
            }
            if viewModel.loading {
                ProgressView("Loading Recipes")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                List($viewModel.list, id: \.id) { $item in
                    RecipeCell(item, imageSize)
                }
                .listRowSpacing(15)
                .scrollContentBackground(.hidden)
                .scrollIndicators(.never)
                .listStyle(.plain)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .refreshable {
                    Task {
                        viewModel.fetch(loader: false)
                    }
                }
                .renderSize(ratio: CGSize(width: 0.25, height: 0.4)) {
                    size in
                    imageSize = size
                }
            }
        }
        .safeAreaPadding()
        .onAppear {
            viewModel.fetch()
        }
    }
}

#Preview {
    ReciepsPage()
}
