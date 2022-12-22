//
//  ItemModel.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 22/12/22.
//

import Foundation
struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let description: String
    let dueDate: Date
    let isCompleted: Bool
}
