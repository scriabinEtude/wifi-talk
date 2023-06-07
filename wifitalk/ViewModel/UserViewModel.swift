//
//  UserViewModel.swift
//  wifitalk
//
//  Created by escher on 2023/06/08.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var user: User?
    
    private let userController = DataManager.shared.user
    
    init() {
        self.user = self.getUser()
    }
    
    func getUser() -> User {
        return self.userController.fetch()
            ?? self.userController.update(
                    name: "",
                    profileImage: BinaryProfileGenerator().generate49().source
            )
    }
    
    func updateUser(name: String?, profileImage: String?) -> User {
        return self.userController.update(name: name, profileImage: profileImage)
    }
}
