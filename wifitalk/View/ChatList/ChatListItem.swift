//
//  ChatListItem.swift
//  wifitalk
//
//  Created by escher on 2023/06/07.
//

import SwiftUI

struct ChatListItem: View {
    let wifi: Wifi
    let user: User
    
    var body: some View {
        NavigationLink(destination: ChatView(wifi: wifi, user: user)) {
            HStack {
                VStack(alignment: .leading) {
                    Text(wifi.name)
                        .bold()
                        .foregroundColor(.black)
                    Text(wifi.ssid)
                        .foregroundColor(Color.gray)
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(Color.gray)
            }.padding()
        }
    }
}
