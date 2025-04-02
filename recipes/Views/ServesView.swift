//
//  CookTimeView.swift
//  recipes
//
//  Created by Atirek Pothiwala on 27/03/25.
//

import SwiftUI

struct CookTimeView: View {
    var value: String
    
    init(_ value: String) {
        self.value = value
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 7.5) {
            Text("Cook Time")
                .font(.system(size: 15, weight: .regular))
            Text(self.value)
                .font(.system(size: 15, weight: .bold))
            Image(systemName: "frying.pan.fill")
                .font(.system(size: 15, weight: .regular))
        }
        .foregroundStyle(.white)
        .shadow(color: .black, radius: 10)
    }
}

#Preview {
    CookTimeView("4 mins")
}
