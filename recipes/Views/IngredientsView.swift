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
                    let item = list[index]
                    let text = item.quantity > 0 ? "\(item.name) (\(item.quantity) \(item.unit))" : item.name
                    Text(text)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 15, weight: .regular))
                        .foregroundStyle(.black)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                    
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
