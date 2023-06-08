//
//  ProfileImage.swift
//  wifitalk
//
//  Created by escher on 2023/06/07.
//

import SwiftUI

struct ProfileImageView: View {
    var profileImage: ProfileImage?
    let size: Double
    
    init(profileImage: ProfileImage? = nil, size: Double) {
        self.profileImage = profileImage
        self.size = size
    }
    
    init(withSource source: String?, size: Double) {
        if source == nil {
            self.init(profileImage: nil, size: size)
        } else {
            self.init(profileImage: ProfileImage(source: source!), size: size)
        }
    }
    
    var body: some View {
        if profileImage != nil {
            if profileImage!.isBinaryProfile {
                BinaryProfileView(size: size, profile: profileImage!.binaryProfile!)
                    .clipShape(Circle())
                    .shadow(radius: 0.2)
            }
        }
        
    }
}

struct ProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImageView(profileImage: Mock.profileImage, size: 200)
    }
}
