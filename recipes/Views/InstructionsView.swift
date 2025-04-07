//
//  InstructionsView.swift
//  recipes
//
//  Created by Atirek Pothiwala on 27/03/25.
//

import SwiftUI

struct InstructionsView: View {
    
    let list: [InstructionModel]
    
    init(_ list: [InstructionModel]) {
        self.list = list
    }
    
    var body: some View {
        VStack(spacing: 15) {
            Text("Instructions")
                .frame(maxWidth: .infinity, alignment: .center)
                .font(.system(size: 20, weight: .semibold))
                .foregroundStyle(.black)
                .padding(.top, 5)
            
            VStack {
                ForEach(0..<list.count, id: \.self) { index in
                    let item = list[index]
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Step \(index + 1)")
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
                    
                    if index < list.count - 1 {
                        Rectangle()
                            .foregroundStyle(.gray.opacity(0.15))
                            .frame(maxWidth: .infinity, maxHeight: 1)
                    }
                }
            }
            .padding(.vertical, 10)
            .cornerRadius(15, antialiased: true)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.gray.opacity(0.15), lineWidth: 1)
            )
        }
        .frame(maxWidth: .infinity)
        .padding(.all)
    }
}
