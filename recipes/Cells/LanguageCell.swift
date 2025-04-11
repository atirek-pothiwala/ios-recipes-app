//
//  LanguageCell.swift
//  recipes
//
//  Created by Atirek Pothiwala on 11/04/25.
//

import SwiftUI

struct LanguageCell: View {
    let item: LanguageItem
    let defaultKey: String
    let selectedKey: String
    
    init(_ item: LanguageItem, _ defaultKey: String, _ selectedKey: String) {
        self.item = item
        self.defaultKey = defaultKey
        self.selectedKey = selectedKey
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(item.title)
                    .font(.system(size: 15, weight: .regular))
                Text(item.subtitle)
                    .font(.system(size: 12, weight: .regular))
            }
            .foregroundStyle(.white)
            
            Spacer()
            
            if item.key == defaultKey {
                Image(systemName: "checkmark")
                    .foregroundStyle(.green)
            } else if item.key == selectedKey {
                Image(systemName: "checkmark")
                    .foregroundStyle(.white)
            }
        }
        .background(.clear)
        .padding(.horizontal, 20)
        .padding(.vertical, 15)
    }
}

#Preview {
    let item = LanguageItem(key: "English", title: "English", subtitle: "United States")
    LanguageCell(item, "English", "English")
}
