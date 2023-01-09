//
//  UserModel.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 22/12/22.
//

import Foundation

struct User: Codable {
    let id: Int
    let name: String
    let email: String
    let gender: String
    var status: String
}

struct ErrorMessage: Codable {
    let field: String
    let message:String
}
