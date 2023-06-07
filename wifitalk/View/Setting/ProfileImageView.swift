//
//  ProfileImage.swift
//  wifitalk
//
//  Created by escher on 2023/06/07.
//

import SwiftUI

struct ProfileImageView: View {
    let profileImage: ProfileImage
    
    var body: some View {
        if profileImage.isBinaryProfile {
            BinaryProfileView(size: 200, profile: profileImage.binaryProfile!)
                .clipShape(Circle())
                .shadow(radius: 0.2)
        }
    }
}

struct ProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImageView(profileImage: Mock.profileImage)
    }
}
