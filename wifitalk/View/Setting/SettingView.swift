//
//  SettingView.swift
//  wifitalk
//
//  Created by escher on 2023/06/07.
//

import SwiftUI

struct SettingView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @State var name: String = ""
    
    var body: some View {
        VStack(spacing: 50) {
            VStack {
                ProfileImageView(withBase64: userViewModel.user?.profileImage, size: 200)
                NavigationLink(destination: UpdateProfileView.init, label: {
                    Label("이미지 변경", systemImage: "pencil")
                })
                .padding(.top, 20)
                
            }.padding(.top, 20)
            
            HStack {
                Text("별명").bold()
                Spacer()
                TextField(
                    "별명을 입력해 주세요",
                    text: $name
                )
                .multilineTextAlignment(.trailing)
                .onChange(of: name) { newValue in
                    userViewModel.updateUser(name: newValue, profileImage: nil)
                }
            }.padding()
            Spacer()
        }
        .navigationTitle("설정")
        .onAppear {
            self.name = userViewModel.user?.name ?? ""
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
