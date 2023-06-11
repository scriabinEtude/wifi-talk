//
//  ViewUtil.swift
//  wifitalk
//
//  Created by escher on 2023/06/08.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
