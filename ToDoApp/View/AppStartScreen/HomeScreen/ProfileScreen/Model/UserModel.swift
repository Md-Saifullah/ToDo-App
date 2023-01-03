//
//  UserModel.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 22/12/22.
//

import Foundation

struct User: Codable {
    let name: String
    let email: String
    let isLoggedIn: Bool
}
