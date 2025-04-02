//
//  NavigationBarModifier.swift
//  recipes
//
//  Created by Atirek Pothiwala on 24/03/25.
//

import SwiftUI

struct KeyboardModifier: ViewModifier {

    typealias OnClick = () -> Void
    
    var onClose: OnClick?
    var onNext: OnClick?
    var onPrev: OnClick?
    
    init(onClose: OnClick? = nil,
         onNext: OnClick? = nil,
         onPrev: OnClick? = nil) {
        self.onClose = onClose
        self.onNext = onNext
        self.onPrev = onPrev
}
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    
                    Button {
                        onClose?()
                    } label: {
                        Text("Close")
                    }
                    .foregroundStyle(.black)
                    .disabled(onClose == nil)
                    
                    Spacer()
                    
                    Button {
                        onPrev?()
                    } label: {
                        Image(systemName: "chevron.up")
                    }.disabled(onPrev == nil)
                    
                    Button {
                        onNext?()
                    } label: {
                        Image(systemName: "chevron.down")
                    }.disabled(onNext == nil)
                }
            }
            .ignoresSafeArea(.keyboard, edges: .all)
    }
}
