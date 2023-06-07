//
//  TestView.swift
//  wifitalk
//
//  Created by escher on 2023/06/06.
//

import SwiftUI

struct TestView: View {
    @EnvironmentObject var wifi: WifiViewModel
    
    var body: some View {
        VStack {
            Text("result")
            
            if wifi.isWifiStateChanged {
                Text("true")
            } else {
                Text("false")
            }
            
            Button(action: {
                var w1 = Wifi(name: "test name 2", ssid: "test ssid 1")
                var w2 = Wifi(name: "test name 2", ssid: "test ssid 2")
                print(w1 == w2)
                
                var wo1 = Optional(wifitalk.Wifi(name: "test name 1", ssid: "test ssid 1"))
                var wo2 = Optional(wifitalk.Wifi(name: "test name 2", ssid: "test ssid 2"))
                print(wo1 == wo2)
                
                var ws1 = WifiState(connected: true, wifi: Optional(wifitalk.Wifi(name: "test name 2", ssid: "test ssid 2")))
                var ws2 = WifiState(connected: true, wifi: Optional(wifitalk.Wifi(name: "test name 1", ssid: "test ssid 1")))
                
                print(ws1.wifi == ws2.wifi)
                print(ws1 == ws2)
                
            }) {
                Text("Button")
            }
        }
        
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
