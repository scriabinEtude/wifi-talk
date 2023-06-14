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
    
    init(source: String?, size: Double) {
        if source == nil {
            self.init(profileImage: nil, size: size)
        } else {
            self.init(profileImage: ProfileImage(source: source!), size: size)
        }
    }
    
    var body: some View {
        switch profileImage?.type {
        case .base64:
            Image(uiImage: UIImage(data: Data(
                base64Encoded: profileImage!.source,
                options: .ignoreUnknownCharacters
            )!)!)
            .resizable()
            .scaledToFit()
            .frame(width: size, height: size)
            .clipShape(Circle())
            .shadow(radius: 0.2)
        case .binary:
            BinaryProfileView(
                size: self.size,
                profile: BinaryProfile(source: profileImage!.source)
            )
            .clipShape(Circle())
            .shadow(radius: 0.2)
        default :
            Spacer().frame(width: size, height: size)
        }
        
    }
}
