//
//  ReciepsPage.swift
//  recipes
//
//  Created by Atirek Pothiwala on 28/03/25.
//

import SwiftUI

typealias RecipeItem = (
    title: String,
    image: String,
    prepTime: String,
    cookTime: String,
    serves: Int
)

struct ReciepsPage: View {
    @State var sizeImage: CGSize = .zero
        
    var body: some View {
        VStack(alignment: .leading) {
            ToolbarView {
                print("Open Filter")
            }
            
            List(Constants.shared.recipes, id: \.title) { item in
                HStack(alignment: .top, spacing: 15) {
                    Image(item.image)
                        .resizable()
                        .frame(
                            width: sizeImage.width,
                            height: sizeImage.height
                        )
                        .cornerRadius(15, antialiased: true)
                        .scaledToFit()
                    
                    VStack(alignment: .leading, spacing: 7.5) {
                        
                        Text(item.title)
                            .foregroundStyle(Color.accentColor)
                            .font(.system(size: 24, weight: .semibold))
                        
                        Rectangle()
                            .foregroundStyle(.gray.opacity(0.2))
                            .frame(height: 1)
                            .frame(maxWidth: .infinity)
                            .padding(.bottom, 5)
                        
                        PrepTimeView(
                            item.prepTime,
                            direction: .leading,
                            textColor: .accentColor,
                            shadowColor: .clear
                        )
                        
                        CookTimeView(
                            item.cookTime,
                            direction: .leading,
                            textColor: .accentColor,
                            shadowColor: .clear
                        )
                        
                        ServesView(
                            "\(item.serves)",
                            direction: .leading,
                            textColor: .accentColor,
                            shadowColor: .clear
                        )
                    }
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                }
                .modifier(RecipeCellModifier())
            }
            .listRowSpacing(15)
            .scrollContentBackground(.hidden)
            .scrollIndicators(.never)
            .listStyle(.plain)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onGeometryChange(for: CGRect.self) { proxy in
                proxy.frame(in: .global)
            } action: { newValue in
                sizeImage = CGSize(
                    width: newValue.width * 0.25,
                    height: newValue.width * 0.4
                )
            }
        }
        .safeAreaPadding()
    }
}

#Preview {
    ReciepsPage()
}
