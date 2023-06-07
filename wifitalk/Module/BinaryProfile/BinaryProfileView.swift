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

struct BinaryProfileView_Previews: PreviewProvider {
    static var previews: some View {
        BinaryProfileView(size: 100, profile: Mock.binaryProfile)
    }
}
