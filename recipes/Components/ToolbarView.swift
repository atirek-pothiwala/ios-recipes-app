//
//  ToolbarView.swift
//  recipes
//
//  Created by Atirek Pothiwala on 28/03/25.
//

import SwiftUI

struct ToolbarView: View {
    typealias OnFilter = () -> Void
    
    var onFilter: OnFilter?
    
    init(_ onFilter: OnFilter? = nil) {
        self.onFilter = onFilter
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 15) {
            Image.init("logo")
                .resizable()
                .frame(width: 45, height: 45)
                .scaledToFit()
                .cornerRadius(15, antialiased: true)
            
            Text("Recipes")
                .font(.system(size: 30, weight: .semibold))
                .foregroundStyle(Color.accent)
            
            if onFilter != nil {
                Spacer()
                
                Button {
                    self.onFilter?()
                } label: {
                    Image(systemName: "slider.horizontal.3")
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundStyle(Color.accent)
                }

            }
        }
    }
}

#Preview {
    ToolbarView {
        
    }
}
