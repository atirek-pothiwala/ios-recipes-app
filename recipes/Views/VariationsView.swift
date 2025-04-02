//
//  InstructionsView.swift
//  recipes
//
//  Created by Atirek Pothiwala on 27/03/25.
//

import SwiftUI

struct InstructionsView: View {
    
    let instructions: [String]
    
    init(_ instructions: [String]) {
        self.instructions = instructions
    }
    
    var body: some View {
        VStack(spacing: 15) {
            Text("Instructions")
                .frame(maxWidth: .infinity, alignment: .center)
                .font(.system(size: 20, weight: .semibold))
                .foregroundStyle(.black)
                .padding(.top, 5)
            
            VStack {
                ForEach(0..<self.instructions.count, id: \.self) { index in
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Step \(index + 1)")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundStyle(.black)
                        
                        Text(self.instructions[index])
                            .font(.system(size: 15, weight: .regular))
                            .foregroundStyle(.black)
                            .padding(.top, 5)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 10)
                    
                    if index < self.instructions.count - 1 {
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

#Preview {
    let instructions: [String] = [
        "Whisk eggs, water, salt and pepper.",
        "Melt butter in an 8-inch (20 cm) nonstick frying pan over medium heat. Pour in egg mixture. As eggs set around edge of pan, with spatula, gently push cooked portions toward centre of skillet. Tilt and rotate skillet to allow uncooked egg to flow into empty spaces.",
        "When eggs are almost set on surface but still look moist, cover half of omelette with filling. Slip spatula under unfilled side; fold over onto filled half.",
        "Cook for a minute, then slide omelette onto plate."
    ]
    InstructionsView(instructions)
}
