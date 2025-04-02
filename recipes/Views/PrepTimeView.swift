//
//  PrepTimeView.swift
//  recipes
//
//  Created by Atirek Pothiwala on 27/03/25.
//

import SwiftUI

struct PrepTimeView: View {
    var title: String
    var value: String
    var systemImage: String
    
    init(title: String, value: String, systemImage: String) {
        self.title = title
        self.value = value
        self.systemImage = systemImage
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 7.5) {
            Text(self.title)
                .font(.system(size: 15, weight: .regular))
            Text(self.value)
                .font(.system(size: 15, weight: .bold))
            Image(systemName: self.systemImage)
                .font(.system(size: 20, weight: .regular))
        }
        .foregroundStyle(.white)
        .shadow(color: .black, radius: 10)
    }
}

#Preview {
    PrepTimeView(title: "Serves",
              value: "1",
              systemImage: "fork.knife.circle.fill")
}
