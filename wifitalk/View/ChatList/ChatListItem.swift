//
//  ChatListItem.swift
//  wifitalk
//
//  Created by escher on 2023/06/07.
//

import SwiftUI

struct ChatListItem: View {
    let wifi: Wifi
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                Text(wifi.name)
                    .bold()
                Text(wifi.ssid)
                    .foregroundColor(Color.gray)
            }
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(Color.gray)
        }.padding()
    }
}

struct ChatListItem_Previews: PreviewProvider {
    static var previews: some View {
        ChatListItem(
            wifi: Mock.wifiStates[0].wifi!
        )
    }
}
