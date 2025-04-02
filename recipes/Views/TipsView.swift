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
                    .padding(.top, 5)
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
        .padding(.all)
        .background(.yellow)
        .cornerRadius(15, antialiased: true)
        .frame(maxWidth: .infinity)
        .padding(.all)
        
    }
}

#Preview {
        
    let list: [VariationItem] = [
        VariationItem(
            "Western Omelette",
            "Spray skillet with cooking spray or heat 1 tsp (5 mL) vegetable oil in skillet. Add 1/4 cup (60 mL) finely chopped ham, 2 tbsp (30 mL) chopped sweet green pepper and 1 tbsp (15 mL) finely chopped onion; cook, stirring frequently, until vegetables are tender. Pour in egg mixture and cook as directed in the Basic Omelette recipe."
        ),
        VariationItem(
            "Fine Herbs Omelette",
            "Add 2 tbsp (30 mL) finely chopped parsley, 1 tsp (5 mL) finely chopped green onion, 1/2 tsp (2 mL) dried tarragon and 1/8 tsp (0.5 mL) finely chopped garlic to egg mixture in the Basic Omelette recipe. Cook as directed."
        ),
        VariationItem(
            "Mushroom and Spinach Omelette",
            "Filling ingredients: 3 tbsp (45 mL) each sauteed mushrooms, wilted spinach (or thawed and well-drained frozen spinach), sliced green onions, and shredded old Cheddar cheese."
        )
    ]
    
    VariationsView(list)
}
