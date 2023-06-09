//
//  UpdateProfileViewModal.swift
//  wifitalk
//
//  Created by escher on 2023/06/08.
//

import SwiftUI

struct UpdateProfileView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @State var newProfile: String?
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                VStack {
                    HStack {
                        Text("현재 프로필")
                            .font(.system(.title3))
                            .padding(.trailing, 20)
                        Spacer()
                    }
                    ProfileImageView(withBase64: userViewModel.user?.profileImage, size: 50)
                }.padding()
                
                VStack(alignment: .center) {
                    HStack {
                        Text("새로운 프로필")
                            .font(.system(.title3))
                        Spacer()
                    }
                    ProfileImageView(withBase64: newProfile, size: 200)
                    Button(action: generate) {
                        Text(newProfile == nil ? "생성하기" : "재생성")
                    }.padding(.top, 10)
                }.padding()
                Spacer()
            }
        }
        .navigationTitle("이미지 변경")
        .toolbar {
            Button(action: saveProfile) {
                Text("변경")
            }.disabled(self.newProfile == self.userViewModel.user?.profileImage)
        }
    }
}

// MARK: - Helper

extension UpdateProfileView {
    func generate() {
        self.newProfile = BinaryProfileGenerator.generateBase64()
    }
    
    func saveProfile() {
        userViewModel.updateUser(name: nil, profileImage: self.newProfile)
    }
}

struct UpdateProfileViewModal_Previews: PreviewProvider {
    static var previews: some View {
        UpdateProfileView()
    }
}
