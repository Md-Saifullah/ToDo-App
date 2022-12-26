//
//  UserViewModel.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 26/12/22.
//

import Foundation
class UserViewModel: ObservableObject {
    let userKey = "user_key"
    @Published var user: User = .init(name: "", email: "", isLoggedIn: false) {
        didSet {
            saveUser()
        }
    }

    init() {
        getUser()
    }

    func setUser(_ user: User) {
        self.user = user
    }

    func clearUser() {
        setUser(User(name: "", email: "", isLoggedIn: false))
    }

    func getUser() {
        guard
            let data = UserDefaults.standard.data(forKey: userKey),
            let decodedData = try? JSONDecoder().decode(User.self, from: data)
        else { return }
        user = decodedData
    }

    func saveUser() {
        if let encodedData = try? JSONEncoder().encode(user) {
            UserDefaults.standard.set(encodedData, forKey: userKey)
        }
    }
}
