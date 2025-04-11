//
//  ToolbarView.swift
//  recipes
//
//  Created by Atirek Pothiwala on 28/03/25.
//

import SwiftUI

struct ToolbarView: View {
    typealias OnClick = () -> Void
    
    var onClick: OnClick?
    
    init(_ onClick: OnClick? = nil) {
        self.onClick = onClick
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 15) {
            Image.init("logo")
                .resizable()
                .frame(width: 45, height: 45)
                .scaledToFit()
                .cornerRadius(15, antialiased: true)
            
            Text("app_title".localized)
                .font(.system(size: 30, weight: .semibold))
                .foregroundStyle(Color.accent)
            
            if onClick != nil {
                Spacer()
                
                Button {
                    self.onClick?()
                } label: {
                    Image(systemName: "globe.central.south.asia.fill")
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
