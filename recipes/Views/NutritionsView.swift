//
//  InstructionsView.swift
//  recipes
//
//  Created by Atirek Pothiwala on 27/03/25.
//

import SwiftUI

typealias NutritionFact = (title: String, servings: String)

struct NutritionsView: View {
    
    let list: [NutritionFact]
    
    init(_ list: [NutritionFact]) {
        self.list = list
    }
    
    var body: some View {
        VStack(spacing: 15) {
            Text("Nutrition Facts")
                .frame(maxWidth: .infinity, alignment: .center)
                .font(.system(size: 20, weight: .semibold))
                .foregroundStyle(.black)
                .padding(.top, 5)
         
            VStack {
                headerView()
                listView()
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
    
    func headerView() -> some View {
        VStack(spacing: 0) {
            HStack(alignment: .center, spacing: 0) {
                Text("Per Servings")
                    .font(.system(size: 15, weight: .black))
                    .foregroundStyle(.black)
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            
            Rectangle()
                .foregroundStyle(.gray.opacity(0.15))
                .frame(maxWidth: .infinity, maxHeight: 1)
        }
    }
    
    func listView() -> some View {
        ForEach(0..<list.count, id: \.self) { index in
            VStack(spacing: 0) {
                HStack(alignment: .center, spacing: 0) {
                    Text(list[index].title)
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundStyle(.black)
                    Spacer()
                    Text(list[index].servings)
                        .font(.system(size: 15, weight: .regular))
                        .foregroundStyle(.black)
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                
                if index < list.count - 1 {
                    Rectangle()
                        .foregroundStyle(.gray.opacity(0.15))
                        .frame(maxWidth: .infinity, maxHeight: 1)
                }
            }
        }
    }
}

#Preview {
    NutritionsView(Constants.shared.nutritionFacts)
}
