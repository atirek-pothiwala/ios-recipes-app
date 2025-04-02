//
//  InstructionsView.swift
//  recipes
//
//  Created by Atirek Pothiwala on 27/03/25.
//

import SwiftUI

struct TipsView: View {
    
    let list: [String]
    
    init(_ list: [String]) {
        self.list = list
    }
    
    var body: some View {
        VStack(spacing: 15) {
            HStack(alignment: .center) {
                Image(systemName: "paperclip")
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundStyle(.black)
                
                Text("Tips")
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundStyle(.black)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            ForEach(list, id: \.self) { item in
                HStack(alignment: .firstTextBaseline, spacing: 10) {
                    Image(systemName: "checkmark.circle")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundStyle(.black)
                    
                    Text(item)
                        .font(.system(size: 15, weight: .regular))
                        .foregroundStyle(.black)
                        .padding(.top, 5)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding(.all, 20)
        .background(.green.opacity(0.3))
        .cornerRadius(15, antialiased: true)
        .frame(maxWidth: .infinity)
        .padding(.all)
        
    }
}

#Preview {
    TipsView(Constants.shared.tips)
}
