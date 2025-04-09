//
//  IngredientsView.swift
//  recipes
//
//  Created by Atirek Pothiwala on 27/03/25.
//

import SwiftUI

struct IngredientsView: View {
    
    let list: [IngredientModel]
    
    init(_ list: [IngredientModel]) {
        self.list = list
    }
    
    var body: some View {
        VStack(spacing: 15) {
            Text("Ingredients")
                .frame(maxWidth: .infinity, alignment: .center)
                .font(.system(size: 20, weight: .semibold))
                .foregroundStyle(.black)
                .padding(.top, 5)
            
            VStack {
                ForEach(0..<list.count, id: \.self) { index in
                    IngredientCell(item: list[index])
                    
                    if index < list.count - 1 {
                        Rectangle()
                            .foregroundStyle(.gray.opacity(0.1))
                            .frame(maxWidth: .infinity, maxHeight: 1)
                    }
                }
            }
            .padding(.vertical, 10)
            .background(Color.gray.opacity(0.15))
            .cornerRadius(15, antialiased: true)
        }
        .frame(maxWidth: .infinity)
        .padding(.all)
    }
}
