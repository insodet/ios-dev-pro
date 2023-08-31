//
//  ImagePicker.swift
//  IOS Developer Pro
//
//  Created by Roman Sukhorukov on 31.08.2023.
//

import SwiftUI
import PhotosUI

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var image: Image?
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        let controller = PHPickerViewController(configuration: context.coordinator.configuration)
        controller.delegate = context.coordinator
        context.coordinator.image = _image
        return controller
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        context.coordinator.image = _image
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        
        let configuration: PHPickerConfiguration
        var image: Binding<Image?>? = nil
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            results
                .lazy
                .map(\.itemProvider)
                .forEach { provider in
                    if provider.canLoadObject(ofClass: UIImage.self) {
                        provider.loadObject(ofClass: UIImage.self) { img, _ in
                            if let uiImage = img as? UIImage {
                                DispatchQueue.main.sync {
                                    self.image?.wrappedValue = Image(uiImage: uiImage)
                                }
                            }
                        }
                    }
            }
            picker.dismiss(animated: true)
        }
        
        fileprivate override init() {
            var configuration = PHPickerConfiguration(photoLibrary: .shared())
            configuration.filter = .images
            configuration.selectionLimit = 1
            self.configuration = configuration
            super.init()
        }
        
    }
}
