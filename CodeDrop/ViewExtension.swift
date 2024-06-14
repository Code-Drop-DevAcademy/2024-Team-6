//
//  ViewExtension.swift
//  CodeDrop
//
//  Created by 신승아 on 6/15/24.
//

import Foundation
import SwiftUI

extension View {
    // SwiftUI View를 UIImage로 변환하는 함수
    func asUIImage(size: CGSize) -> UIImage {
        let controller = UIHostingController(rootView: self)
        let view = controller.view

        // Ensure the view uses a transparent background
        view?.bounds = CGRect(origin: .zero, size: size)
        view?.backgroundColor = .clear
        view?.isOpaque = false // 투명도를 유지하기 위해 필요

        let format = UIGraphicsImageRendererFormat()
        format.opaque = false // 투명도를 유지

        let renderer = UIGraphicsImageRenderer(size: size, format: format)
        return renderer.image { context in
            // 투명한 배경을 설정
            context.cgContext.setFillColor(UIColor.clear.cgColor)
            context.cgContext.fill(view!.bounds)
            view?.drawHierarchy(in: view!.bounds, afterScreenUpdates: true)
        }
    }
}
