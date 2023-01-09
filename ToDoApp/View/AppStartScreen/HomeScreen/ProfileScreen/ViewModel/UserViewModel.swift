//
//  UserViewModel.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 26/12/22.
//

import Foundation
class UserViewModel: ObservableObject {
    @Published var user: User = .init(id: 0, name: "", email: "", gender: "", status: "inactive") {
        didSet {
            saveUser()
        }
    }

    private let networkManager = NetworkManager()
    private let userKey = "user_key"

    init() {
        getUser()
    }

    private func getUser() {
        guard
            let data = UserDefaults.standard.data(forKey: userKey),
            let decodedData = try? JSONDecoder().decode(User.self, from: data)
        else { return }
        user = decodedData
    }

    private func saveUser() {
        if let encodedData = try? JSONEncoder().encode(user) {
            UserDefaults.standard.set(encodedData, forKey: userKey)
        }
    }

    func getUserBy(_ email: String, onCompletion: @escaping (Bool) -> Void) {
        networkManager.getUserBy(email) { data in
            guard let safeData = data else {
                onCompletion(false)
                return
            }
            self.setUser(safeData)
            onCompletion(true)
            print(self.user)
        }
    }

    func createUser(_ user: User) -> Bool {
        let user: User? = networkManager.createUser(user)
        guard let user = user else {
            return false
        }
        setUser(user)
        return true
    }

    func setUser(_ user: User) {
        ListViewModel.fromNetwork = true
        self.user = user
        self.user.status = "active"
    }

    func clearUser() {
        user = User(id: 0, name: "", email: "", gender: "", status: "inactive")
    }
}
