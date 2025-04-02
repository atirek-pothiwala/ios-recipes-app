//
//  NavigationBarModifier.swift
//  recipes
//
//  Created by Atirek Pothiwala on 24/03/25.
//

import SwiftUI

typealias OnClick = () -> Void

struct NavigationBarModifier: ViewModifier {
    
    var title: String
    var onBack: OnClick?
    var onNextField: OnClick?
    var onPrevField: OnClick?
    var isNextField: Bool
    var isPrevField: Bool
    
    init(_ title: String,
         onBack: OnClick? = nil,
         onNextField: OnClick? = nil,
         isNextField: Bool = false,
         onPrevField: OnClick? = nil,
         isPrevField: Bool = false) {
        self.title = title
        self.onBack = onBack
        self.onNextField = onNextField
        self.onPrevField = onPrevField
        self.isNextField = isNextField
        self.isPrevField = isPrevField
    }
    
    func body(content: Content) -> some View {
        content
            .navigationTitle(title)
            .navigationBarBackButtonHidden()
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                if (onBack != nil) {
                    ToolbarItem(placement: .topBarLeading) {
                        BackButtonView("Login") {
                            onBack?()
                        }
                    }
                }
                
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button {
                        onNextField?()
                    } label: {
                        Image(systemName: "chevron.up")
                    }.disabled(!isNextField)
                    
                    Button {
                        onPrevField?()
                    } label: {
                        Image(systemName: "chevron.down")
                    }.disabled(!isPrevField)

                }
            }
    }
}
