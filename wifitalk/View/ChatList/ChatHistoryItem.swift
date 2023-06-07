//
//  ChatHistoryItem.swift
//  wifitalk
//
//  Created by escher on 2023/06/07.
//

import SwiftUI

struct ChatHistoryItem: View {
    let wifi: Wifi
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(wifi.name)
            Text(wifi.ssid).foregroundColor(Color.gray)
        }
    }
}

struct ChatHistoryItem_Previews: PreviewProvider {
    static var previews: some View {
        ChatHistoryItem(wifi: Mock.wifiStates[0].wifi!)
    }
}
