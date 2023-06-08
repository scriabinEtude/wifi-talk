//
//  ChatMessageView.swift
//  wifitalk
//
//  Created by escher on 2023/06/08.
//

import SwiftUI

struct ChatMessageView: View {
    let message: ChatMessage
    
    var body: some View {
        Image(uiImage: ProfileImageView(withSource: message.profileImage, size: 30).asImage)
            .frame(width: 30, height: 30)
//        ProfileImageView(withSource: message.profileImage, size: 30)
        HStack {
            if message.isMine {
                Spacer()
                Text(message.message)
                    .padding(12)
                    .background(Color.blue)
                    .font(.system(size: 15))
                    .clipShape(ChatBubble(isMine: true))
                    .foregroundColor(.white)
                    .padding(.leading, 100)
                    .padding(.horizontal)
            } else {
                HStack(alignment: .bottom) {
//                    Image(uiImage: ProfileImageView(withSource: message.profileImage, size: 30).asImage)
//                        .frame(width: 30, height: 30)
                    Text(message.message)
                        .padding(12)
                        .background(Color(.systemGray5))
                        .font(.system(size: 15))
                        .clipShape(ChatBubble(isMine: false))
                        .foregroundColor(.black)
                }
                .padding(.horizontal)
                .padding(.trailing, 80)
                
                Spacer()
            }
        }
    }
}
