//
//  InstructionsView.swift
//  recipes
//
//  Created by Atirek Pothiwala on 27/03/25.
//

import SwiftUI

struct TipsView: View {
    
    let list: [TipModel]
    
    init(_ list: [TipModel]) {
        self.list = list
    }
    
    var body: some View {
        VStack(spacing: 15) {
            HStack(alignment: .center) {
                Image(systemName: "paperclip")
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundStyle(.black)
                
                Text("tips".localized)
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundStyle(.black)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            ForEach(list, id: \.self) { item in
                TipCell(item: item)
            }
        }
        .padding(.all, 20)
        .background(.green.opacity(0.3))
        .cornerRadius(15, antialiased: true)
        .frame(maxWidth: .infinity)
        .padding(.all)
        
    }
}
