//
//  ChatMessageView.swift
//  wifitalk
//
//  Created by escher on 2023/06/08.
//

import SwiftUI

struct ChatMessageView: View {
    let vm: ChatMessageViewModel
    
    var body: some View {
        VStack {
            if vm.isFirstChatOnDate {
                VStack {
                    Text(vm.dateDisplay)
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 4)
                        .background(Color(.systemGray2))
                        .cornerRadius(50)
                }
                .padding(.vertical, 12)
            }
            if vm.isShowingProfile {
                Spacer().frame(height: 12)
            }
            HStack {
                if vm.message.isMine {
                    HStack(alignment: .bottom) {
                        Spacer()
                        if vm.isShowingTimeDisplay {
                            TimeDisplay(vm.timeDisplay)
                        }
                        Text(vm.message.message)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(Color.blue)
                            .font(.system(size: 15))
                            .clipShape(ChatBubble(isMine: true))
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal)
                    .padding(.leading, 80)
                } else {
                    HStack(alignment: .top) {
                        if vm.isNotShowingProfile {
                            Spacer().frame(width: 43)
                            HStack(alignment: .bottom) {
                                OpponentMessage(vm.message)
                                if vm.isShowingTimeDisplay {
                                    TimeDisplay(vm.timeDisplay)
                                }
                            }
                        } else {
                            ProfileImageView(
                                source: vm.message.profileImage,
                                size: 35
                            )
                            HStack(alignment: .bottom) {
                                VStack(alignment: .leading, spacing: 6) {
                                    Text(vm.message.name)
                                        .font(.system(size: 15))
                                        .foregroundColor(.gray)
                                    OpponentMessage(vm.message)
                                }
                                if vm.isShowingTimeDisplay {
                                    TimeDisplay(vm.timeDisplay)
                                }
                            }
                        }
                        
                    }
                    .padding(.horizontal)
                    .padding(.trailing, 80)
                    
                    Spacer()
                }
            }
        }
    }
}

private struct OpponentMessage: View {
    let message: ChatMessage
    init(_ message: ChatMessage) {
        self.message = message
    }
    
    var body: some View {
        Text(message.message)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(Color(.systemGray3))
            .font(.system(size: 15))
            .clipShape(ChatBubble(isMine: false))
    }
}

private struct TimeDisplay: View {
    let timeDisplay: String
    init(_ timeDisplay: String) {
        self.timeDisplay = timeDisplay
    }
    
    var body: some View {
        Text(timeDisplay)
            .font(.system(size: 12))
            .foregroundColor(.gray)
    }
}
