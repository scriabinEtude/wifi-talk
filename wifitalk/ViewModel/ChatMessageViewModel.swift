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
    
    init(message: ChatMessage, before: ChatMessage?, after: ChatMessage?) {
        self.message = message
        self.before = before
        self.after = after
    }
    
    private func format(_ target: ChatMessage, fs formatString: String) -> String {
        return target.timestamp.dateValue().format(formatString)
    }
    
    private func isOver1Min(_ target: ChatMessage?) -> Bool {
        if target == nil { return true }
        let fs = "yyyy-MM-dd HH:mm"
        return format(message, fs: fs) != format(target!, fs: fs)
    }
    
}
