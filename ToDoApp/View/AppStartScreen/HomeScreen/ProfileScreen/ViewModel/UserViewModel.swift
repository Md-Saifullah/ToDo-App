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

    func getUserBy(_ email: String) -> Bool {
        var ret: Bool=false
        networkManager.getUserBy(email) { data in
            if let safeData = data{
                self.user=safeData
                print(self.user)
                ret = true
                //return true
            }
            //self.user = data
        } // User(id: 0, name: "test", email: "test", gender: "", status: "active") // networkManage.getUserBy(email) //
        
//        guard let user = data else {
//            print("came nil")
//            return false
//        }
//        print("came true")
//        //setUser(user)
//        return true
        print(user)
        return ret
        // MARK: - get from network

        // User(id: 0, name: "test", email: "test", gender: "", status: "active")
    }

    func createUser(_ user: User) -> Bool {
        let user: User? = networkManager.createUser(user) // User(id: 0, name: "test", email: "test", gender: "", status: "active") // nil //

        // MARK: - get from network

        // User(id: 0, name: "test", email: "test", gender: "", status: "active")

        guard let user = user else {
            return false
        }
        setUser(user)
        return true
    }

    func setUser(_ user: User) {
        ListViewModel.fromNetwork = true
        self.user = user
    }

    func clearUser() {
        setUser(User(id: 0, name: "", email: "", gender: "", status: "inactive"))
    }
}
