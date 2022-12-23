//
//  ListView.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 21/12/22.
//

import SwiftUI

struct ListView: View {
    @State var items: [ItemModel] = [
        ItemModel(title: "first and also long text for testing purpose", dueDate: Date.now, isCompleted: true),
        ItemModel(title: "second", dueDate: Date.now, isCompleted: true),
        ItemModel(title: "third", dueDate: Date.now, isCompleted: false),
        ItemModel(title: "fourth", dueDate: Date.now, isCompleted: false),
        ItemModel(title: "fourth", dueDate: Date.now, isCompleted: false),
        ItemModel(title: "second", dueDate: Date.now, isCompleted: true)
    ]
    var body: some View {
        ZStack {
            NavigationStack {
                List {
                    ForEach(items) { item in
                        ListRowView(item: item)
                    }
                    .onDelete(perform: deleteItem)
                    .onMove(perform: moveItem)
                }
                .padding(.top)
                .scrollContentBackground(.hidden)
                .listStyle(.plain)
                .navigationTitle("ToDo App 📝")
            }
        }
    }

    func deleteItem(at: IndexSet) {}

    func moveItem(from: IndexSet, to: Int) {}
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            ListView()
        }
    }
}
