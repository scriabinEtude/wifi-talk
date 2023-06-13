//
//  ChatHistoryItem.swift
//  wifitalk
//
//  Created by escher on 2023/06/07.
//

import SwiftUI

struct ChatHistoryItem: View {
    let wifi: WifiHistory
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(wifi.ssid!)
                Spacer()
                Text(wifi.updatedAt!.format("M월 d일"))
                    .foregroundColor(Color.gray)
                    .font(.system(size: 12))
            }
            Text(wifi.bssid!).foregroundColor(Color.gray)
        }
    }
}
