//
//  RecipeListPage.swift
//  recipes
//
//  Created by Atirek Pothiwala on 28/03/25.
//

import SwiftUI

struct FavouriteListPage: View {
    
    @EnvironmentObject var toastor: Toastor
    @EnvironmentObject var navigator: Navigator
    
    @StateObject private var viewModel = FavouriteListVM()
    @State var imageSize: CGSize = .zero
        
    var body: some View {
        VStack(alignment: .leading) {
            if viewModel.loading {
                ProgressView("Loading Favourites")
                    .tint(Color.accent)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if !viewModel.list.isEmpty {
                List {
                    ForEach($viewModel.list, id: \.id) { $item in
                        RecipeCell(item, imageSize)
                            .onTapGesture {
                                navigator.push(Route.recipeDetail(item))
                            }
                    }
                    .onDelete { indexSet in
                        viewModel.remove(atOffsets: indexSet)
                    }
                }
                .listRowSpacing(15)
                .scrollContentBackground(.hidden)
                .scrollIndicators(.never)
                .listStyle(.plain)
                .refreshable {
                    Task {
                        viewModel.fetch(loader: false)
                    }
                }
                .ignoresSafeArea(.container, edges: .horizontal)
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
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .modifier(NavigationBarModifier("My Favourites") {
            navigator.pop()
        })
        .applyToast(toastor, viewModel.error, of: .error)
        .safeAreaPadding()
        .onAppear {
            viewModel.fetch()
        }
    }
}

#Preview {
    RecipeListPage()
}
