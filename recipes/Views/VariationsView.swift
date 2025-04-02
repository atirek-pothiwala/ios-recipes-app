//
//  InstructionsView.swift
//  recipes
//
//  Created by Atirek Pothiwala on 27/03/25.
//

import SwiftUI

typealias VariationItem = (title: String, subtitle: String)

struct VariationsView: View {
    
    let list: [VariationItem]
    
    init(_ list: [VariationItem]) {
        self.list = list
    }
    
    var body: some View {
        VStack(spacing: 15) {
            HStack(alignment: .center) {
                Image(systemName: "swirl.circle.righthalf.filled.inverse")
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundStyle(.black)
                
                Text("Variations")
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundStyle(.black)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            ForEach(list, id: \.title) { item in
                VStack(alignment: .leading, spacing: 0) {
                    Text(item.0)
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundStyle(.black)
                    
                    Text(item.1)
                        .font(.system(size: 15, weight: .regular))
                        .foregroundStyle(.black)
                        .padding(.top, 5)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding(.all, 20)
        .background(.yellow)
        .cornerRadius(15, antialiased: true)
        .frame(maxWidth: .infinity)
        .padding(.all)
        
    }
}

#Preview {
    VariationsView(Constants.shared.variations)
}
