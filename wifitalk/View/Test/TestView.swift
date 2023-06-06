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
        }
        
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
