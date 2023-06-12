//
//  ChatMessageViewModel.swift
//  wifitalk
//
//  Created by escher on 2023/06/12.
//

import Foundation

struct ChatMessageViewModel {
    let message: ChatMessage
    let before: ChatMessage?
    let after: ChatMessage?
    
    var isShowingProfile: Bool { !isNotShowingProfile }
    var isNotShowingProfile: Bool {
        before?.uuid == message.uuid && !isOver1Min(before)
    }
    
    var isShowingTimeDisplay: Bool { isOver1Min(after) }
    var timeDisplay: String { format(message, fs: "a h:mm") }
    var dateDisplay: String { format(message, fs: "yyyy년 M월 d일 E요일") }
    
    var isFirstChatOnDate: Bool {
        !isSameDate(before, fs: "yyyy-MM-dd")
    }
    
    init(message: ChatMessage, before: ChatMessage?, after: ChatMessage?) {
        self.message = message
        self.before = before
        self.after = after
    }
    
    private func format(_ target: ChatMessage, fs formatString: String) -> String {
        return target.timestamp.dateValue().format(formatString)
    }
    
    private func isOver1Min(_ target: ChatMessage?) -> Bool {
        !isSameDate(target, fs: "yyyy-MM-dd HH:mm")
    }
    
    private func isSameDate(_ target: ChatMessage?, fs formatString: String) -> Bool {
        guard let target = target else { return false }
        return format(message, fs: formatString) == format(target, fs: formatString)
    }
    
}
