//
//  ToastView.swift
//  recipes
//
//  Created by Atirek Pothiwala on 07/04/25.
//

import SwiftUI

struct ToastView: View {
    
    typealias OnClose = (String) -> Void
    
    let id: String
    let message: String
    let systemImage: Toastor.ToastType
    let onClose: OnClose?
    
    init(_ id: String, _ message: String, _ systemImage: Toastor.ToastType, _ onClose: OnClose? = nil) {
        self.id = id
        self.message = message
        self.systemImage = systemImage
        self.onClose = onClose
    }
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: systemImage.image)
                .font(.title)
                .foregroundStyle(systemImage.color)
            Text(message)
                .font(.callout)
                .foregroundStyle(Color.accent)
            Spacer()
            if onClose != nil {
                Button {
                    onClose?(id)
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(.gray)
                        .font(.title3)
                }
            }
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 15)
        .background {
            RoundedRectangle(cornerRadius: 15)
                .fill(.background)
                .shadow(radius: 3)
        }
    }
}

#Preview {
    ToastView("1", "Something went wrong!", Toastor.ToastType.info) {
        id in
    }
}
