//
//  ItemModel.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 22/12/22.
//

import Foundation

struct Item: Identifiable, Codable {
    let id: String
    let title: String
    let dueDate: Date
    let isCompleted: Bool

    init(id: String = UUID().uuidString, title: String, dueDate: Date, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.dueDate = dueDate
        self.isCompleted = isCompleted
    }
}

struct Todo: Codable {
    let id: Int
    let user_id: Int
    let title: String
    let due_on: String
    let status: String
}

struct TodoResponseModel: Codable {
    let title: String
    let due_on: String
    let status: String
}
