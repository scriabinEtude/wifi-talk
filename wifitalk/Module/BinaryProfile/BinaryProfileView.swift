//
//  BinaryProfileView.swift
//  wifitalk
//
//  Created by escher on 2023/06/07.
//

import SwiftUI

struct BinaryProfileView: View {
    let size: Double
    let profile: BinaryProfile
    
    var color: Color {
        Color(red: profile.r.rgbRatio(), green: profile.g.rgbRatio(), blue: profile.b.rgbRatio())
    }
    
    var rectangleSize: Double {
        size / profile.edgeSize.double()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(0..<profile.edgeSize, id: \.self) { i in
                HStack(spacing: 0) {
                    ForEach(0..<profile.edgeSize, id: \.self) { j in
                        Rectangle()
                            .foregroundColor(profile.binary[(i + (j * profile.edgeSize))] ? color : Color.white)
                            .frame(width: rectangleSize, height: rectangleSize)
                    }
                }
            }
        }
    }
}

extension BinaryProfileView {
    var asImage: UIImage {
        // Must ignore safe area due to a bug in iOS 15+ https://stackoverflow.com/a/69819567/1011161
        let controller = UIHostingController(rootView: self.edgesIgnoringSafeArea(.top))
        let view = controller.view
        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: CGPoint(x: 0, y: 0), size: targetSize)
        view?.backgroundColor = .clear
        
        let format = UIGraphicsImageRendererFormat()
        format.scale = 3 // Ensures 3x-scale images. You can customise this however you like.
        let renderer = UIGraphicsImageRenderer(size: targetSize, format: format)
        return renderer.image { _ in
//            view?.resizableSnapshotView(from: controller.view.bounds, afterScreenUpdates: true, withCapInsets: .zero)!
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
}
