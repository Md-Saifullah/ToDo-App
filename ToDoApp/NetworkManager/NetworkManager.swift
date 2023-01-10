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

    func createTodo(_ todo: Todo, onCompletion: @escaping (Todo?) -> Void) {
        guard let url = URL(string: "\(prefixUrl)/users/\(todo.user_id)/todos") else {
            onCompletion(nil)
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("Bearer \(bearer)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        print(todo)

        let body = TodoResponseModel(title: todo.title, due_on: todo.due_on, status: todo.status)
        do {
            let encodedTodo = try JSONEncoder().encode(body)
            request.httpBody = encodedTodo
        } catch {
            print(error)
            onCompletion(nil)
            return
        }
        let task = URLSession(configuration: .default).dataTask(with: request) { data, _, error in
            if error == nil {
                if let safeData = data {
                    print("came here")
                    do {
                        let decodedTodo = try JSONDecoder().decode(Todo.self, from: safeData)
                        DispatchQueue.main.async {
                            print(decodedTodo)
                            onCompletion(decodedTodo)
                        }
                    } catch {
                        onCompletion(nil)
                        print(error)
                    }
                }
            }
        }
        task.resume()
    }

    func getUserToDo(id: Int, onCompletion: @escaping ([Todo]?) -> Void) {
        print(id)
        guard let url = URL(string: "\(prefixUrl)/users/\(id)/todos") else {
            print("URL error")
            onCompletion(nil)
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer \(bearer)", forHTTPHeaderField: "Authorization")
        let task = URLSession(configuration: .default).dataTask(with: request) { data, _, error in
            if error == nil {
                if let safeData = data {
                    do {
                        let decodedTodos = try JSONDecoder().decode([Todo].self, from: safeData)
                        DispatchQueue.main.async {
                            onCompletion(decodedTodos)
                        }
                    } catch {
                        print("catch Error")
                        onCompletion(nil)
                        print("\(String(describing: error))")
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
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer \(bearer)", forHTTPHeaderField: "Authorization")
        let task = URLSession(configuration: .default).dataTask(with: request) { data, _, error in
            if error == nil {
                if let safeData = data {
                    do {
                        let getUser = try JSONDecoder().decode([User].self, from: safeData)
                        DispatchQueue.main.async {
                            onCompletion(getUser)
                        }
                    } catch {
                        onCompletion(nil)
                        print(error)
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

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("Bearer \(bearer)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            let encodedData = try JSONEncoder().encode(user)
            request.httpBody = encodedData
        } catch {
            onCompletion(nil, [ErrorMessage(field: "Input data", message: "Invalid")])
        }

        let task = URLSession(configuration: .default).dataTask(with: request) { data, _, error in

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
}
