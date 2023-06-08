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
                    ProfileImageView(withSource: userViewModel.user?.profileImage, size: 50)
                }.padding()
                
                VStack(alignment: .center) {
                    HStack {
                        Text("새로운 프로필")
                            .font(.system(.title3))
                        Spacer()
                    }
                    ProfileImageView(withSource: newProfile, size: 200)
                    Button(action: generate) {
                        Text("재생성")
                    }.padding(.top, 10)
                }.padding()
                Spacer()
            }
        }
        .onAppear { generate() }
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
        self.newProfile = BinaryProfileGenerator.generate49().source
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
