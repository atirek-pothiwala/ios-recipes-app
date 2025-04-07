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
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fill)
            case .failure:
                EmptyView()
            @unknown default:
                EmptyView()
            }
        }
    }
    
    @State private var image: UIImage? = nil
    
    var sessionImageView: some View {
        Group {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fill)
            } else {
                ProgressView()
                    .onAppear {
                        loadImage()
                    }
            }
        }
    }
    
    func loadImage() {
        guard let imageUrl = URL(string: Constants.IMAGE_BASE_URL + url) else {
            return
        }
        URLSession.shared.dataTask(with: imageUrl) { data, _, _ in
            if let data = data, let uiImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = uiImage
                }
            }
        }.resume()
    }
}
