//
//  NetworkManager.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 6/1/23.
//

import Foundation
struct NetworkManager {
    let prefixUrl = "https://gorest.co.in/public/v2"
    let bearer = "5b12feb3ddfac89a73dfe2e34b948bfdc7c5872c06079e95dbf877032a1321bc"
    func getUserBy(_ email: String, onCompletion: @escaping (User?)->Void) {
        let url = URL(string: "\(prefixUrl)/users?email=\(email)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer \(bearer)", forHTTPHeaderField: "Authorization")
        let task = URLSession(configuration: .default).dataTask(with: request) { data, _, error in
            if error == nil {
                if let safeData = data {
                    do {
                        let getUser = try JSONDecoder().decode([User].self, from: safeData)
                        DispatchQueue.main.async {
                            onCompletion(getUser.first)
                        }
                    } catch{
                        print(error)
                    }
                }
            }
        }
        task.resume()

//        print("1")
//        if let url = URL(string: "\(prefixUrl)/users?email=\(email)") {
//            print("2")
//            let session = URLSession(configuration: .default)
//            print("3")
//            let task = session.dataTask(with: url) { data, _, error in
//                print("4")
//                if error == nil {
//                    print("5")
//                    if let safeData = data {
//                        print("6")
//                        do {
//                            print("7")
//                            let getUser = try JSONDecoder().decode([User].self, from: safeData)
//                            print("8")
//                            DispatchQueue.main.async {
//                                print("9")
//                                onCompletion(getUser.first ?? nil)
//                                print(getUser)
//                            }
//                            print("10")
//                        } catch {
//                            print("11")
//                            print(error)
//                        }
//                    }
//                }
//            }
//            task.resume()
//            print("12")
//        }
//        print("13")
    }

    func createUser(_ user: User)->User? {
        return nil
    }
}
