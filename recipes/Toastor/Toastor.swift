//
//  Toastor.swift
//  recipes
//
//  Created by Atirek Pothiwala on 06/04/25.
//


import SwiftUI

class Toastor: ObservableObject {
    
    @Published var toasts: [ToastModel] = []

    func show(_ message: String, _ type: ToastType = .error, _ onClose: (() -> Void)? = nil) {
        withAnimation(.bouncy) {
            let toast = ToastModel { id in
                ToastView(id, message, type) {
                    id in
                    self.toasts.removeAll { $0.id == id }
                    onClose?()
                }
            }
            toasts.append(toast)
        }
    }
}

extension Toastor {
    enum ToastType {
        case info
        case error
        case success
        
        var image: String {
            switch self {
            case .info:
                return "info.circle.fill"
            case .error:
                return "xmark.seal.fill"
            case .success:
                return "checkmark.seal.fill"
            }
        }
        
        var color: Color {
            switch self {
            case .info:
                return .orange
            case .error:
                return .red
            case .success:
                return .green
            }
        }
    }
}

extension View {
    func applyToast(_ toastor: Toastor, _ message: String, of type: Toastor.ToastType = .info) -> some View {
        self.onChange(of: message) { oldValue, newValue in
            if !newValue.isEmpty {
                toastor.show(newValue, type)
            }
        }
    }
    
    func addEnvironmentToastor(_ toaster: Toastor) -> some View {
        self.environmentObject(toaster)
            .interactiveToasts(
                Binding(get: { toaster.toasts }, set: { toaster.toasts = $0 })
            )
    }
        
    @ViewBuilder
    private func interactiveToasts(_ toasts: Binding<[ToastModel]>) -> some View {
        self.frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(alignment: .bottom) {
                ToastsView(toasts)
            }
    }
}

extension Binding<[ToastModel]> {
    func delete(_ id: String) {
        if let toast = first(where: {$0.id == id}) {
            toast.wrappedValue.isDeleting = true
        }
        withAnimation(.bouncy) {
            self.wrappedValue.removeAll(where: { $0.id == id })
        }
    }
    
    func clear() {
        self.forEach { toast in
            toast.wrappedValue.isDeleting = true
        }
        withAnimation(.bouncy) {
            self.wrappedValue.removeAll()
        }
        
    }
}
