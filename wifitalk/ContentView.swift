//
//  ContentView.swift
//  wifitalk
//
//  Created by escher on 2023/06/05.
//

import SwiftUI

struct ContentView: View {
    @State var ssids = [String]()
    var body: some View {
        TestView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
