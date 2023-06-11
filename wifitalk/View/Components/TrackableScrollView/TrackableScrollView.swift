//
//  TrackableScrollView.swift
//  TrackableScrollView
//
//  Created by maxnatchanon on 26/12/2019 BE.
//  Copyright © 2019 maxnatchanon All rights reserved.
//
import SwiftUI

@available(iOS 13.0, *)
public struct TrackableScrollView<Content>: View where Content: View {
    let axes: Axis.Set
    @Binding var contentOffset: CGFloat
    let callback: (CGFloat) -> Void
    let content: Content
    
    public init(_ axes: Axis.Set = .vertical, contentOffset: Binding<CGFloat>, callback: @escaping(CGFloat) -> Void, @ViewBuilder content: () -> Content) {
        self.axes = axes
        self._contentOffset = contentOffset
        self.callback = callback
        self.content = content()
    }
    
    public var body: some View {
        GeometryReader { outsideProxy in
            ScrollView(self.axes, showsIndicators: false) {
                ZStack(alignment: self.axes == .vertical ? .top : .leading) {
                    GeometryReader { insideProxy in
                        Color.clear
                            .preference(key: ScrollOffsetPreferenceKey.self, value: [self.calculateContentOffset(fromOutsideProxy: outsideProxy, insideProxy: insideProxy)])
                    }
                    VStack {
                        self.content
                    }
                }
            }
            .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                self.contentOffset = value[0]
                callback(self.contentOffset)
            }
        }
    }
    
    private func calculateContentOffset(fromOutsideProxy outsideProxy: GeometryProxy, insideProxy: GeometryProxy) -> CGFloat {
        if axes == .vertical {
            return outsideProxy.frame(in: .global).minY - insideProxy.frame(in: .global).minY
        } else {
            return outsideProxy.frame(in: .global).minX - insideProxy.frame(in: .global).minX
        }
    }
}
