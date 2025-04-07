//
//  Data+Extension.swift
//  recipes
//
//  Created by Atirek Pothiwala on 04/04/25.
//

import Foundation

extension Data {
    func convertToDictionary() -> Dictionary<String, Any>? {
        do {
            let json = try JSONSerialization.jsonObject(with: self, options: [])
            return json as? [String: Any]
        } catch {
            debugPrint("❌ Failed to convert data to dictionary:", error)
            return nil
        }
    }
}
