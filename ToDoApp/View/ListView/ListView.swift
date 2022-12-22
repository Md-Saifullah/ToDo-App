//
//  ListView.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 21/12/22.
//

import SwiftUI

struct ListView: View {
    @State var items: [ItemModel] = [
        ItemModel(title: "first", description: "first description", dueDate: Date.now, isCompleted: true),
        ItemModel(title: "second", description: "first \n mulasdasdasd\ndsf\ndsfsd\n sdfsdfsd\ndsfsdfsdfsdf\n\n\n\ntiline description", dueDate: Date.now, isCompleted: true),
        ItemModel(title: "third", description: "second multiline \n description", dueDate: Date.now, isCompleted: false),
        ItemModel(title: "fourth", description: "first description", dueDate: Date.now, isCompleted: false),
        ItemModel(title: "fourth", description: "first description", dueDate: Date.now, isCompleted: false),
        ItemModel(title: "second", description: "first \n mulasdasdasdndsf\ndsfsd sdfsdfsddsfsd fsdfsdf ntiline description", dueDate: Date.now, isCompleted: true)
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
                .scrollContentBackground(.hidden)
                .listStyle(.plain)
                .navigationTitle("ToDo App 📝")
            }
        }
    }
    func deleteItem(at: IndexSet){
        
    }
    func moveItem(from: IndexSet,to: Int){
        
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            ListView()
        }
    }
}
