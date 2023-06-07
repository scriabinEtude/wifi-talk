//
//  SettingView.swift
//  wifitalk
//
//  Created by escher on 2023/06/07.
//

import SwiftUI

struct SettingView: View {
    @State var name: String = ""
    
    var body: some View {
        VStack(spacing: 50) {
            VStack {
                ProfileImageView(profileImage: Mock.profileImage)
                Button(action: {
                    
                }, label: {
                    Label("Edit", systemImage: "pencil")
                })
            }.padding(.top, 50)
            
            HStack {
                Text("별명")
                Spacer()
                TextField(
                    "별명",
                    text: $name
                ).multilineTextAlignment(.trailing)
            }.padding()
            Spacer()
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
