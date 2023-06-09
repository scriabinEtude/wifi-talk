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
    
    init(withBase64 source: String?, size: Double) {
        if source == nil {
            self.init(profileImage: nil, size: size)
        } else {
            self.init(profileImage: ProfileImage(source: source!), size: size)
        }
    }
    
    var body: some View {
        if profileImage != nil {
            if profileImage!.isBinaryProfile {
                Image(uiImage: UIImage(data: Data(base64Encoded: profileImage!.source, options: .ignoreUnknownCharacters)!)!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: size, height: size)
                    .clipShape(Circle())
                    .shadow(radius: 0.2)
            }
        }
        
    }
}
