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
                ProfileImageView(
                    profileImage: ProfileImage(source: userViewModel.user!.binarySource!),
                    size: 200
                )
                NavigationLink(destination: UpdateProfileView.init, label: {
                    Label("이미지 변경", systemImage: "pencil")
                })
                .padding(.top, 20)
            }
            .padding(.top, 20)
            
            HStack {
                Text("별명").bold()
                Spacer()
                TextField(
                    "별명을 입력해 주세요",
                    text: $name
                )
                .multilineTextAlignment(.trailing)
                .onChange(of: name) { newValue in
                    userViewModel.updateUser(
                        name: newValue,
                        binarySource: nil,
                        profileImage: nil
                    )
                }
            }.padding()
            Spacer()
            VStack {
                Divider()
                NavigationItem(
                    destination: ReportView(),
                    title: "기능 건의 & 버그 제보"
                )
                Divider()
            }
            .padding(.bottom, 30)
        }
        .onAppear {
            self.name = userViewModel.user?.name ?? ""
        }
        .navigationTitle("설정")
    }
}

struct NavigationItem: View {
    let destination: any View
    let title: String
    
    var body: some View {
        NavigationLink(destination: AnyView(destination)) {
            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .bold()
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(Color.gray)
            }
            .padding()
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }
}
