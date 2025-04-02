//
//  CardView.swift
//  recipes
//
//  Created by Atirek Pothiwala on 28/03/25.
//

import SwiftUI

struct CardView: View {
    @State var sizeCard: CGSize = .zero
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: 0) {
                PhotoView
                DescriptionView
                IngredientsView(Constants.shared.ingredients)
                InstructionsView(Constants.shared.instructions)
                VariationsView(Constants.shared.variations)
                TipsView(Constants.shared.tips)
                NutritionsView(Constants.shared.nutritionFacts)
            }
            .frame(width: sizeCard.width)
        }
        .scrollIndicators(.never)
        .background(.white)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onGeometryChange(for: CGRect.self) { proxy in
            proxy.frame(in: .global)
        } action: { newValue in
            sizeCard = CGSize(
                width: newValue.width,
                height: newValue.height
            )
        }
        .cornerRadius(15, antialiased: true)
        .shadow(radius: 2)
    }
    
    var TitleView: some View {
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
    
    var PhotoView: some View {
        ZStack(alignment: .bottomLeading, content: {
            Image.init("omelette")
                .resizable()
                .scaledToFill()
                .frame(
                    width: sizeCard.width,
                    height: sizeCard.height
                )
            
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
                
                TitleView
            }
            .padding(.all)
        })
    }
    
    var DescriptionView: some View {
        Text(Constants.shared.description)
            .frame(maxWidth: .infinity, alignment: .center)
            .font(.system(size: 16, weight: .regular))
            .padding(.all)
    }
}

#Preview {
    CardView()
}
