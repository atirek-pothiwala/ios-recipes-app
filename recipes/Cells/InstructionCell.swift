//
//  InstructionCell.swift
//  recipes
//
//  Created by Atirek Pothiwala on 09/04/25.
//

import SwiftUI

struct InstructionCell: View {
    let item: InstructionModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(String.init(format: "step".localized, item.stepNumber))
                .font(.system(size: 15, weight: .semibold))
                .foregroundStyle(.black)
            
            Text(item.description)
                .font(.system(size: 15, weight: .regular))
                .foregroundStyle(.black)
                .padding(.top, 5)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
    }
}
