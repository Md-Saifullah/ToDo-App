//
//  UserViewModel.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 26/12/22.
//

import Foundation
class UserViewModel: ObservableObject {
    @Published var user: User{
        didSet{
            saveUser()
        }
    }
    init(user: User = User(name: "", email: "", isLoggedIn: false)) {
        self.user = user
    }

    func setUser(_ user: User) {
        self.user = user
    }
    
    func clearUser() {
        setUser(User(name: "", email: "", isLoggedIn: false))
    }
    func saveUser(){
        
    }
}
