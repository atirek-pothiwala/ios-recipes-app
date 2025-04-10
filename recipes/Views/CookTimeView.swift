//
//  CookTimeView.swift
//  recipes
//
//  Created by Atirek Pothiwala on 27/03/25.
//

import SwiftUI

struct CookTimeView: View {
    var value: String
    var direction: HorizontalEdge
    var textColor: Color
    var shadowColor: Color
    
    init(_ value: String,
         direction: HorizontalEdge = .trailing,
         textColor: Color = .white,
         shadowColor: Color = .black) {
        self.value = value
        self.direction = direction
        self.textColor = textColor
        self.shadowColor = shadowColor
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 7.5) {
            if direction == .leading {
                Image(systemName: "frying.pan.fill")
                    .font(.system(size: 15, weight: .regular))
            }
            Text("cook_time".localized)
                .font(.system(size: 15, weight: .regular))
            Text(self.value)
                .font(.system(size: 15, weight: .bold))
            if direction == .trailing {
                Image(systemName: "frying.pan.fill")
                    .font(.system(size: 15, weight: .regular))
            }
        }
        .foregroundStyle(textColor)
        .shadow(color: shadowColor, radius: 10)
    }
}

#Preview {
    CookTimeView("4 mins")
}
