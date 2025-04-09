//
//  TipCell.swift
//  recipes
//
//  Created by Atirek Pothiwala on 09/04/25.
//

import SwiftUI

struct TipCell: View {
    let item: TipModel
    
    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 10) {
            Image(systemName: "checkmark.circle")
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
