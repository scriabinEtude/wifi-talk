//
//  MessageInputView.swift
//  wifitalk
//
//  Created by escher on 2023/06/08.
//

import SwiftUI

struct MessageInputView: View {
    @Binding var messageInput: String
    let onSend: (String) -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            Divider()
            HStack {
                TextField("", text: $messageInput)
                Button(action: { onSend(messageInput) }) {
                    messageInput.isEmpty
                        ? Image(systemName: "paperplane")
                        : Image(systemName: "paperplane.fill")
                }
            }
            .padding()
        }
        
    }
}

struct MessageInputView_Previews: PreviewProvider {
    static var previews: some View {
        MessageInputView(
            messageInput: .constant("메세지 입력"),
            onSend: { s in print(s) }
        )
    }
}
