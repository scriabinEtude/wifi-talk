//
//  ChatBubble.swift
//  wifitalk
//
//  Created by escher on 2023/06/08.
//

import SwiftUI

struct ChatBubble: Shape {
    var isMine: Bool
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: [
                .topLeft,
                .topRight,
                isMine ? .bottomLeft : .bottomRight
            ],
            cornerRadii: CGSize(width: 16, height: 16))
        
        return Path(path.cgPath)
    }
}

struct ChatBubble_Previews: PreviewProvider {
    static var previews: some View {
        ChatBubble(isMine: true)
    }
}
