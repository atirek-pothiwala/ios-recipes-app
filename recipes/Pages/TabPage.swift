//
//  TabPage.swift
//  recipes
//
//  Created by Atirek Pothiwala on 23/03/25.
//

import SwiftUI

struct TabPage: View {
        
    var body: some View {
        TabView {
            DiscoverView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .tabItem {
                    Label("Dicover", systemImage: "tornado")
                }
            
            RecipesView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .tabItem {
                    Label("Recipes", systemImage: "fork.knife")
                }
        }
        .toolbarBackground(Color.accentColor, for: .tabBar)
        .navigationBarBackButtonHidden()
    }
}

struct RecipesView: View {
    var body: some View {
        Text("Recipes View")
            .font(.largeTitle)
            .padding()
    }
}

struct DiscoverView: View {
    
    @State var rectCard: CGRect = .zero
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: 0) {
                recipePhoto
                descriptionView
                IngredientsView(Constants.shared.ingredients)
                InstructionsView(Constants.shared.instructions)
                VariationsView(Constants.shared.variations)
                TipsView(Constants.shared.tips)
                NutritionsView(Constants.shared.nutritionFacts)
            }
            .frame(width: rectCard.width)
        }
        .background(.white)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onGeometryChange(for: CGRect.self) { proxy in
            proxy.frame(in: .global)
        } action: { newValue in
            self.rectCard = newValue
        }
        .cornerRadius(15, antialiased: true)
        .shadow(radius: 2)
        .safeAreaPadding()

    }
    
    var titleView: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Omelette")
                .foregroundStyle(.white)
                .font(.system(size: 20, weight: .bold))
            
            Text("By Raju Bhai")
                .foregroundStyle(.white)
                .font(.system(size: 16, weight: .semibold))
        }
        .shadow(color: .black, radius: 10)
    }
    
    var recipePhoto: some View {
        ZStack(alignment: .bottomLeading, content: {
            Image.init("omelette")
                .resizable()
                .scaledToFill()
                .frame(width: rectCard.width, height: rectCard.height)
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Spacer()
                    VStack(alignment: .trailing, spacing: 10) {
                        PrepTimeView("2 mins")
                        CookTimeView("4 mins")
                        ServesView("1")
                    }
                }
                
                Spacer()
                
                titleView
            }
            .padding(.all)
        })
    }
    
    var descriptionView: some View {
        Text(Constants.shared.description)
            .frame(maxWidth: .infinity, alignment: .center)
            .font(.system(size: 16, weight: .regular))
            .padding(.all)
    }
}


#Preview {
    NavigationStack {
        TabPage()
    }
}
