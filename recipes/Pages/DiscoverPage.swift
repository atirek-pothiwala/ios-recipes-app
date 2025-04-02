//
//  DiscoverPage.swift
//  recipes
//
//  Created by Atirek Pothiwala on 28/03/25.
//

import SwiftUI

struct DiscoverPage: View {
            
    var body: some View {
        VStack(alignment: .leading) {
            ToolbarView()
         
            CardView()
                .padding(.all, 5)
        }
        .safeAreaPadding()

    }
}

#Preview {
    DiscoverPage()
}
