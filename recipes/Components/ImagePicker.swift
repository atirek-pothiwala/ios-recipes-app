//
//  ImagePicker.swift
//  recipes
//
//  Created by Atirek Pothiwala on 09/04/25.
//


import SwiftUI
import UIKit

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Binding var isPresented: Bool

    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    func makeUIViewController(context: Context) -> UIViewController {
        let controller = UIViewController()
        controller.view.backgroundColor = .clear
        context.coordinator.parent = self // ✅ assign reference
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        DispatchQueue.main.async {
            if self.isPresented && context.coordinator.picker == nil {
                let picker = UIImagePickerController()
                picker.sourceType = .photoLibrary
                picker.delegate = context.coordinator
                picker.allowsEditing = true
                context.coordinator.picker = picker

                uiViewController.present(picker, animated: true) {
                    // Track dismissal to handle swipe-down
                    picker.presentationController?.delegate = context.coordinator
                }
            }
        }
    }


    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIAdaptivePresentationControllerDelegate {
        var parent: ImagePicker
        var picker: UIImagePickerController?

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController,
                                   didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.editedImage] as? UIImage {
                parent.selectedImage = cropToSquare(image)
            } else if let image = info[.originalImage] as? UIImage {
                parent.selectedImage = cropToSquare(image)
            }

            picker.dismiss(animated: true) {
                self.cleanup()
            }
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true) {
                self.cleanup()
            }
        }

        // 🔥 Handle swipe-down dismiss too
        func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
            cleanup()
        }

        private func cleanup() {
            self.picker = nil
            self.parent.isPresented = false
        }

        func cropToSquare(_ image: UIImage) -> UIImage {
            let size = min(image.size.width, image.size.height)
            let originX = (image.size.width - size) / 2
            let originY = (image.size.height - size) / 2
            let cropRect = CGRect(x: originX, y: originY, width: size, height: size)

            guard let cgImage = image.cgImage?.cropping(to: cropRect) else { return image }
            return UIImage(cgImage: cgImage, scale: image.scale, orientation: image.imageOrientation)
        }
    }

}
