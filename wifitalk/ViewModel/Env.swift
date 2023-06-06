//
//  Env.swift
//  wifitalk
//
//  Created by escher on 2023/06/07.
//

import SwiftUI

class Env: ObservableObject {
    @Published var wifiViewModel: WifiViewModel
    
    init(wifiViewModel: WifiViewModel) {
        self.wifiViewModel = wifiViewModel
    }
}
