//
//  ImageView.swift
//  recipes
//
//  Created by Atirek Pothiwala on 04/04/25.
//

import SwiftUI

struct ImageView: View {
    let url: String
    
    var body: some View {
        asyncImageView
    }
    
    var asyncImageView: some View {
        let imageUrl = URL(string: Constants.IMAGE_BASE_URL + url)
        return AsyncImage(url: imageUrl) { phase in
            switch phase {
            case .empty:
                progressView
            case .success(let image):
                image
                    .resizable()
            case .failure:
                placeHolderView
            @unknown default:
                placeHolderView
            }
        }
    }
    
    var progressView: some View {
        ProgressView()
            .tint(Color.accent)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    var placeHolderView: some View {
        EmptyView()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
}
