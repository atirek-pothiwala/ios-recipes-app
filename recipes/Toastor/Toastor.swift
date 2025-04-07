import SwiftUI

class Toastor: ObservableObject {
    @Published var toasts: [Toast] = []

    func showToast(_ message: String = "Default Toast", systemImage: String = "info.circle") {
        withAnimation(.bouncy) {
            let toast = Toast { id, onClose in
                ToastView(id: id, message: message, systemImage: systemImage, onClose: onClose)
            } onClose: {
                self.toasts.delete(toast.id)
            }
            toasts.append(toast)
        }
    }

    func showSuccess(_ message: String) {
        showToast(message, systemImage: "checkmark.seal.fill")
    }

    func showError(_ message: String) {
        showToast(message, systemImage: "xmark.octagon.fill")
    }
}
