//
//  BackButtonView.swift
//  recipes
//
//  Created by Atirek Pothiwala on 24/03/25.
//

import SwiftUI

struct BackButtonView: View {
    var title: String
    var action: () -> Void
    
    init(_ title: String, _ action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: "chevron.backward")
                .foregroundStyle(.white)
                .font(.system(size: 18))
            Text(title)
                .foregroundStyle(.white)
                .font(.system(size: 18))
        }
    }
}

#Preview {
    BackButtonView("Login") {
        
    }
}
