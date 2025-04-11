//
//  Localization.swift
//  recipes
//
//  Created by Atirek Pothiwala on 11/04/25.
//

typealias LanguageItem = (key: String, title: String, subtitle: String)

class Languages {
    
    static var shared: Languages = {
        return Languages()
    }()
    
    private init() {}
    
    let english = LanguageItem(
        key: "English",
        title: "language_english".localized,
        subtitle: "language_english_subtitle".localized
    )
    let hindi = LanguageItem(
        key: "Hindi",
        title: "language_hindi".localized,
        subtitle: "language_hindi_subtitle".localized
    )
    let gujarati = LanguageItem(
        key: "Gujarati",
        title: "language_gujarati".localized,
        subtitle: "language_gujarati_subtitle".localized
    )
    var list: [LanguageItem] {
        return [
            english, hindi, gujarati
        ]
    }
}

