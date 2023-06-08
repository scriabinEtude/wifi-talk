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
        getUser()
    }
    
    func getUser() -> Void {
        self.user = self.userController.fetch()
                 ?? self.userController.update(
                         name: "",
                         profileImage: BinaryProfileGenerator.generateBase64()
                 )
    }
    
    func updateUser(name: String?, profileImage: String?) -> Void {
        self.user = self.userController.update(name: name, profileImage: profileImage)
    }
}
