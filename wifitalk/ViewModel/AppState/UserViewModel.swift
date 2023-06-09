//
//  UserViewModel.swift
//  wifitalk
//
//  Created by escher on 2023/06/08.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var user: User?
    @Published var isCreating: Bool = false
    
    private let userController = DataManager.shared.user
    
    // for test
    func reset() {
        userController.delete()
    }
    
    func getUser() -> Void {
        if let user = self.userController.fetch() {
            self.user = user
        } else {
            isCreating = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.user = self.userController.update(
                                name: "",
                                profileImage: BinaryProfileGenerator.generateBase64()
                            )
                self.isCreating = false

            }
        }
    }
    
    func updateUser(name: String?, profileImage: String?) -> Void {
        self.user = self.userController.update(name: name, profileImage: profileImage)
    }
}
