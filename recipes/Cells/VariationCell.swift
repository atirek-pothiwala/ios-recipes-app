//
//  VariationCell.swift
//  recipes
//
//  Created by Atirek Pothiwala on 09/04/25.
//

import SwiftUI

struct VariationCell: View {
    let item: VariationModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(item.name)
                .font(.system(size: 15, weight: .semibold))
                .foregroundStyle(.black)
            
            Text(item.description)
                .font(.system(size: 15, weight: .regular))
                .foregroundStyle(.black)
                .padding(.top, 5)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
