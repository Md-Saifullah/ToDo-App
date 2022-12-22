//
//  ListRowView.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 22/12/22.
//

import SwiftUI

struct ListRowView: View {
    var item: ItemModel
    var body: some View {
        NavigationLink(destination: {
            EditItemView(item: item)
        }, label: {
            HStack(alignment: .top, spacing: 10) {
                Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .scaledToFit()
                    .foregroundColor(item.isCompleted ? .green : .red)

                VStack(alignment: .leading) {
                    Text(item.title)
                        .font(.title3)
                        .padding(.bottom, 5)
                    Text(item.description)
                        .font(.footnote)
                        .frame(maxWidth: .infinity, maxHeight: 55, alignment: .topLeading)
                }
                .multilineTextAlignment(.leading)
                Spacer()
                Text("Due Date:\n\(item.dueDate, style: Text.DateStyle.date)")
                    .frame(maxWidth: 70)
                    .font(.footnote)
            }
            
        })
        .padding(10)
        
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color("Background"))
        .cornerRadius(15)
        .shadow(color: .gray.opacity(0.6), radius: 6, x: 2, y: 2)
        .listRowSeparator(.hidden)
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ListRowView(
                item: ItemModel(title: "first", description: "first description", dueDate: Date.now, isCompleted: false))
            ListRowView(
                item: ItemModel(title: "second", description: "first \n mulasdasdasd\ndsf\ndsfsd\n sdfsdfsd\ndsfsdfsdfsdf\n\n\n\ntiline description", dueDate: Date.now, isCompleted: true))
            ListRowView(
                item: ItemModel(title: "first", description: "first description", dueDate: Date.now, isCompleted: false))
            ListRowView(
                item: ItemModel(title: "first", description: "first description", dueDate: Date.now, isCompleted: true))
            ListRowView(
                item: ItemModel(title: "second", description: "first \n mulasdasdasd\ndsf\ndsfsd\n sdfsdfsd\ndsfsdfsdfsdf\n\n\n\ntiline description", dueDate: Date.now, isCompleted: true))
        }
    }
}
