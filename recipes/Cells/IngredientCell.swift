//
//  IngredientCell.swift
//  recipes
//
//  Created by Atirek Pothiwala on 09/04/25.
//

import SwiftUI

struct IngredientCell: View {
    let item: IngredientModel
    
    var body: some View {
        let text = !item.quantity.isEmpty ? "\(item.name) (\(item.quantity))" : item.name
        Text(text)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.system(size: 15, weight: .regular))
            .foregroundStyle(.black)
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
    }
}
