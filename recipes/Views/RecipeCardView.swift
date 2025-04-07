//
//  CardView.swift
//  recipes
//
//  Created by Atirek Pothiwala on 28/03/25.
//

import SwiftUI

struct RecipeCardView: View {
    
    @State private var sizeCard: CGSize = .zero
    @State private var swipeColor: Color = .clear
    
    var body: some View {
        PhotoView
            .background(.clear)
            .cornerRadius(15, antialiased: true)
            .shadow(radius: 2)
            .modifier(
                SwipeModifier(color: $swipeColor) { direction in
                    debugPrint("Direction: \(direction.rawValue)")
                }
            )
            .renderSize { size in
                sizeCard = size
            }
    }
    
    var TitleView: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Omelette")
                .foregroundStyle(.white)
                .font(.system(size: 20, weight: .bold))
            
            Text("By Raju Bhai")
                .foregroundStyle(.white)
                .font(.system(size: 16, weight: .semibold))
        }
        .shadow(color: .black, radius: 10)
    }
    
    var descriptionView: some View {
        HStack {
            Spacer()
            VStack(alignment: .trailing, spacing: 10) {
                PrepTimeView("2 mins")
                CookTimeView("4 mins")
                ServesView("1")
            }
        }
    }
    
    var PhotoView: some View {
        ZStack(alignment: .bottomLeading, content: {
            Image.init("omelette")
                .resizable()
                .scaledToFill()
                .frame(width: sizeCard.width, height: sizeCard.height)
            
            VStack(alignment: .leading, spacing: 10) {
                descriptionView
                
                Spacer()
                
                TitleView
            }
            .padding(.all)
            
            Rectangle()
                .fill(swipeColor)
        })
    }
}

#Preview {
    RecipeCardView()
}
