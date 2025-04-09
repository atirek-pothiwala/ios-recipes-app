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
    @FocusState private var focusedInput: Field?
        
    var body: some View {
        VStack(alignment: .leading) {
            ToolbarView()
            
            tfSearch
            
            if viewModel.loading {
                ProgressView("Loading Recipes")
                    .tint(Color.accent)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .onAppear {
                        viewModel.fetch()
                    }
            } else if !viewModel.filteredList.isEmpty {
                List(viewModel.filteredList, id: \.self) { item in
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
    
    var tfSearch: some View {
        SearchTextField(text: $viewModel.search, tint: .accent.opacity(0.5)) {
            Text("Search Recipes")
        }
        .modifier(TextFieldModifier.accent)
        .padding(.bottom, 5)
        .focused($focusedInput, equals: .search)
        .keyboardType(.default)
        .textContentType(.none)
        .textInputAutocapitalization(.none)
        .submitLabel(.done)
        .onSubmit {
            focusedInput = .none
        }
    }
}

private extension RecipeListPage {
    enum Field: Int, Hashable, CaseIterable {
        case search
    }
}

#Preview {
    RecipeListPage()
}
