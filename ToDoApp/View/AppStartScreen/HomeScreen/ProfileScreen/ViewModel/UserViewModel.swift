//
//  UserViewModel.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 26/12/22.
//

import Foundation
class UserViewModel: ObservableObject {
    @Published var user: User = .init(
        id: 0,
        name: "",
        email: "",
        gender: "",
        status: "inactive")
    {
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
            if let safeData = data {
                if let user = safeData.first(where: { $0.email == email }) {
                    self.setUser(user)
                    onCompletion(true)
                }
            }
            onCompletion(false)
        }
    }

    func createUser(_ user: User, onCompletion: @escaping (Bool, [ErrorMessage]?) -> Void) {
        networkManager.createUser(user) { user, errors in
            guard let safeUser = user else {
                onCompletion(false, errors)
                return
            }
            onCompletion(true, errors)
            self.setUser(safeUser)
        }
    }

    func setUser(_ user: User) {
        self.user = user
    }

    func clearUser() {
        setUser(User(
            id: 0,
            name: "",
            email: "",
            gender: "",
            status: "inactive"))
    }
}
