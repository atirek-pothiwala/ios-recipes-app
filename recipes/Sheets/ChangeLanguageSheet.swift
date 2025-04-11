//
//  SheetDialogExample.swift
//  recipes
//
//  Created by Atirek Pothiwala on 07/04/25.
//

import SwiftUI

struct ChangeLanguageSheet: View {
    typealias OnDismiss = (_ isLanguageChanged: Bool) -> Void
    
    private var defaultLanguageKey: String = Constants.shared.language
    @State private var selectedLanguageKey: String = ""
    
    private let list = Languages.shared.list
    private let onDismiss: OnDismiss
    private var isDisabled: Bool {
        return selectedLanguageKey.isEmpty || selectedLanguageKey == defaultLanguageKey
    }
    
    init(onDismiss: @escaping OnDismiss) {
        self.onDismiss = onDismiss
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 30) {
            HStack {
                Spacer()
                btnSubmit
            }
            Spacer()
            titleView
            listView
            btnDismiss
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .safeAreaPadding(.all, 16)
        .background {
            BlurBackground {
                self.dismiss()
            }
        }
        .transition(.move(edge: .bottom))
    }
        
    var titleView: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image(systemName: "globe.central.south.asia.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 75, height: 75)
                .foregroundStyle(Color.accent)
                .padding(.bottom, 15)
            
            Text("change_language".localized)
                .font(.system(size: 24, weight: .semibold))
                .foregroundStyle(Color.accent)
                .padding(.bottom, 5)
            
            Text("change_language_info".localized)
                .font(.system(size: 16, weight: .regular))
                .foregroundStyle(Color.accent.opacity(0.5))
                .multilineTextAlignment(.leading)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var listView: some View {
        VStack {
            ForEach(list.indices, id: \.self) { index in
                let item: LanguageItem = list[index]
                Button {
                    selectedLanguageKey = item.key
                } label: {
                    LanguageCell(item, defaultLanguageKey, selectedLanguageKey)
                }
                
                if index != list.lastIndex {
                    Rectangle()
                        .fill(.white)
                        .frame(height: 1)
                        .padding(.leading, 50)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .background(.accent)
        .clipShape(.rect(cornerRadius: 15))
        .shadow(radius: 2.5)
    }
    
    var btnDismiss: some View {
        Button {
            self.dismiss()
        } label: {
            Image(systemName: "xmark")
        }
        .foregroundStyle(.white)
        .font(.system(size: 18, weight: .bold))
        .padding(.all, 16)
        .background(.accent, in: .circle)
        .shadow(radius: 2.5)
    }
    
    var btnSubmit: some View {
        Button("submit".localized) {
            withAnimation {
                Constants.shared.language = selectedLanguageKey
                onDismiss(true)
            }
        }
        .foregroundStyle(.white)
        .font(.system(size: 14, weight: .semibold))
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(isDisabled ? .gray : .black, in: .capsule)
        .disabled(isDisabled)
    }
    
    private func dismiss() {
        withAnimation {
            onDismiss(false)
        }
    }
}

struct BlurBackground: View {
    let onTap: () -> Void

    var body: some View {
        VisualEffectBlur(style: .systemMaterialLight)
            .ignoresSafeArea()
            .onTapGesture(perform: onTap)
            .transition(.opacity)
    }
}

// UIKit-style blur wrapper
struct VisualEffectBlur: UIViewRepresentable {
    var style: UIBlurEffect.Style = .systemMaterial

    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}

#Preview {
    ChangeLanguageSheet { isLanguageChanged in
        
    }
}
