//
//  InstructionsView.swift
//  recipes
//
//  Created by Atirek Pothiwala on 27/03/25.
//

import SwiftUI

struct VariationsView: View {
    
    let list: [VariationModel]
    
    init(_ list: [VariationModel]) {
        self.list = list
    }
    
    var body: some View {
        VStack(spacing: 15) {
            HStack(alignment: .center) {
                Image(systemName: "swirl.circle.righthalf.filled.inverse")
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundStyle(.black)
                
                Text("variations".localized)
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundStyle(.black)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            ForEach(list, id: \.id) { item in
                VariationCell(item: item)
            }
        }
        .padding(.all, 20)
        .background(.yellow)
        .cornerRadius(15, antialiased: true)
        .frame(maxWidth: .infinity)
        .padding(.all)
        
    }
}
