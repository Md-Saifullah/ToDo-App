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
    let session = URLSession(configuration: .default)

    func createTodo(_ todo: Todo, onCompletion: @escaping (Todo?) -> Void) {
        guard let url = URL(string: "\(prefixUrl)/users/\(todo.user_id)/todos") else {
            onCompletion(nil)
            return
        }
        var request = createRequest(url: url, method: "POST")
        do {
            let encodedTodo = try JSONEncoder().encode(todo)
            request.httpBody = encodedTodo
        } catch {
            onCompletion(nil)
            return
        }
        let task = session.dataTask(with: request) { data, _, error in
            if error == nil {
                if let safeData = data {
                    do {
                        let decodedTodo = try JSONDecoder().decode(Todo.self, from: safeData)
                        DispatchQueue.main.async {
                            onCompletion(decodedTodo)
                        }
                    } catch {
                        onCompletion(nil)
                    }
                }
            }
        }
        task.resume()
    }

    func getUserToDo(id: Int, onCompletion: @escaping ([Todo]?) -> Void) {
        guard let url = URL(string: "\(prefixUrl)/users/\(id)/todos") else {
            onCompletion(nil)
            return
        }
        let request = createRequest(url: url, method: "GET")
        let task = session.dataTask(with: request) { data, _, error in
            if error == nil {
                if let safeData = data {
                    do {
                        let decodedTodos = try JSONDecoder().decode([Todo].self, from: safeData)
                        DispatchQueue.main.async {
                            onCompletion(decodedTodos)
                        }
                    } catch {
                        onCompletion(nil)
                    }
                }
            }
        }
        task.resume()
    }

    func getUserBy(_ email: String, onCompletion: @escaping ([User]?) -> Void) {
        guard let url = URL(string: "\(prefixUrl)/users?email=\(email)") else {
            onCompletion(nil)
            return
        }
        let request = createRequest(url: url, method: "GET")
        let task = session.dataTask(with: request) { data, _, error in
            if error == nil {
                if let safeData = data {
                    do {
                        let getUser = try JSONDecoder().decode([User].self, from: safeData)
                        DispatchQueue.main.async {
                            onCompletion(getUser)
                        }
                    } catch {
                        onCompletion(nil)
                    }
                }
            }
        }
        task.resume()
    }

    func createUser(_ user: User, onCompletion: @escaping (User?, [ErrorMessage]?) -> Void) {
        guard let url = URL(string: "\(prefixUrl)/users") else {
            onCompletion(user, [ErrorMessage(field: "URL", message: "Invalid")])
            return
        }

        var request = createRequest(url: url, method: "POST")

        do {
            let encodedData = try JSONEncoder().encode(user)
            request.httpBody = encodedData
        } catch {
            onCompletion(nil, [ErrorMessage(field: "Input data", message: "Invalid")])
        }

        let task = session.dataTask(with: request) { data, _, error in

            if error == nil {
                if let safeData = data {
                    do {
                        let decodedData = try JSONDecoder().decode(User.self, from: safeData)
                        DispatchQueue.main.async {
                            onCompletion(decodedData, nil)
                        }
                    } catch {
                        do {
                            let decodedErrors = try JSONDecoder().decode([ErrorMessage].self, from: safeData)
                            DispatchQueue.main.async { onCompletion(nil, decodedErrors) }
                        } catch {
                            onCompletion(nil, nil)
                        }
                    }
                }
            }
        }
        task.resume()
    }

    private func createRequest(url: URL, method: String) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.addValue("Bearer \(bearer)", forHTTPHeaderField: "Authorization")
        if method == "POST" {
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        return request
    }
}
