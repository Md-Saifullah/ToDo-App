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
        NavigationView {
            List {
                ForEach(items) { item in
                    ListRowView(item: item)
                        //.listRowInsets(.init(top: 4, leading: 10, bottom: 4, trailing: 10))
                        //.shadow(color: .red, radius: 5)
                        
                }
                
                .onDelete(perform: deleteItem)
                .onMove(perform: moveItem)
            }
            .listStyle(.plain)
            .padding(.top)
            //.scrollContentBackground(.hidden)
            .navigationTitle("ToDo App 📝")
        }
    }

    func deleteItem(at: IndexSet) {}

    func moveItem(from: IndexSet, to: Int) {}
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ZStack {
                ListView()
            }
        }
    }
}
