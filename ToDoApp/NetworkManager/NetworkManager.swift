//
//  NetworkManager.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 6/1/23.
//

import Alamofire
import Foundation

struct NetworkManager {
    let prefixUrl = "https://gorest.co.in/public/v2"
    let headers: HTTPHeaders = [
        "Authorization": "Bearer Token"
    ]

    func createTodo(_ todo: Todo, onCompletion: @escaping (Todo?) -> Void) {
        let url = "\(prefixUrl)/users/\(todo.user_id)/todos"

        AF.request(url, method: .post, parameters: todo, encoder: .json, headers: headers).responseDecodable(of: Todo.self, queue: .main) { response in
            if let safeData = response.data {
                do {
                    let decodedData = try JSONDecoder().decode(Todo.self, from: safeData)
                    onCompletion(decodedData)
                    return
                } catch {
                    onCompletion(nil)
                    return
                }
            }
        }
    }

    func getUserToDo(id: Int, onCompletion: @escaping ([Todo]?) -> Void) {
        let url = "\(prefixUrl)/users/\(id)/todos"

        AF.request(url, headers: headers).responseDecodable(of: Todo.self) { response in
            if let safeData = response.data {
                do {
                    let decodedData = try JSONDecoder().decode([Todo].self, from: safeData)
                    DispatchQueue.main.async {
                        onCompletion(decodedData)
                    }
                } catch {
                    onCompletion(nil)
                }
            }
        }
    }

    func getUserBy(_ email: String, onCompletion: @escaping ([User]?) -> Void) {
        let url = "\(prefixUrl)/users?email=\(email)"

        AF.request(url, headers: headers).responseDecodable(of: Todo.self) { response in
            if let safeData = response.data {
                do {
                    let decodedData = try JSONDecoder().decode([User].self, from: safeData)
                    onCompletion(decodedData)
                } catch {
                    onCompletion(nil)
                }
            }
        }
    }

    func createUser(_ user: User, onCompletion: @escaping (User?, [ErrorMessage]?) -> Void) {
        let url = "\(prefixUrl)/users"

        AF.request(url, method: .post, parameters: user, headers: headers).responseDecodable(of: User.self, queue: .main) { response in
            if let safeData = response.data {
                do {
                    let decodedData = try JSONDecoder().decode(User.self, from: safeData)
                    onCompletion(decodedData, nil)
                } catch {
                    do {
                        let decodedErrors = try JSONDecoder().decode([ErrorMessage].self, from: safeData)
                        onCompletion(nil, decodedErrors)
                    } catch {
                        onCompletion(nil, nil)
                    }
                }
            }
        }
    }
}
