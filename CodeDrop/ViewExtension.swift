//
//  ViewExtension.swift
//  CodeDrop
//
//  Created by 신승아 on 6/15/24.
//

import Foundation
import SwiftUI

import SwiftUI
import UIKit

extension View {
    func asUIImage(size: CGSize) -> UIImage {
        let controller = UIHostingController(rootView: self)
        let view = controller.view

        view?.bounds = CGRect(origin: .zero, size: size)
        view?.backgroundColor = .clear

        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { _ in
            view?.drawHierarchy(in: view!.bounds, afterScreenUpdates: true)
        }
    }
    
    func saveAsPNG(size: CGSize, filename: String) -> URL? {
        let image = self.asUIImage(size: size)
        guard let data = image.pngData() else {
            return nil
        }
        
        let tempDirectory = FileManager.default.temporaryDirectory
        let fileURL = tempDirectory.appendingPathComponent("\(filename).png")
        
        do {
            try data.write(to: fileURL)
            return fileURL
        } catch {
            print("Error saving image: \(error)")
            return nil
        }
    }
}
