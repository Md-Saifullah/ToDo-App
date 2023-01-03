//
//  ToDoListRowView.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 22/12/22.
//

import SwiftUI

struct ToDoListRowView: View {
    var item: Item

    var body: some View {
        NavigationLink(destination: EditItemScreen(item: item)) {
            HStack(alignment: .top, spacing: 10) {
                Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .scaledToFit()
                    .foregroundColor(item.isCompleted ? .green : .red)

                VStack(alignment: .leading) {
                    Text(item.title)
                        .font(.title3)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 5)

                    Text("Due Date: \(item.dueDate, style: Text.DateStyle.date)")
                        .font(.footnote)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .multilineTextAlignment(.leading)
                Spacer()
            }
        }
        .padding(.top)
        .padding(10)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color("Background"))
        .cornerRadius(15)
        .shadow(color: .gray.opacity(0.6), radius: 6)
        .listRowSeparator(.hidden)
    }
}

struct ToDoListRowView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ToDoListRowView(
                item: Item(title: "first and also long text for testing purpose", dueDate: Date.now, isCompleted: false))
            ToDoListRowView(
                item: Item(title: "second", dueDate: Date.now, isCompleted: true))
            ToDoListRowView(
                item: Item(title: "first", dueDate: Date.now, isCompleted: false))
            ToDoListRowView(
                item: Item(title: "first", dueDate: Date.now, isCompleted: true))
            ToDoListRowView(
                item: Item(title: "second", dueDate: Date.now, isCompleted: true))
        }
    }
}
