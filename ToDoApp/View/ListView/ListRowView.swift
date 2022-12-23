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
        NavigationLink(destination: EditItemView(item: item)) {
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
                    Text("Due Date:\(item.dueDate, style: Text.DateStyle.date)")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .font(.footnote)
                    //                    Text(item.description)
                    //                        .font(.footnote)
                    //                        .frame(maxWidth: .infinity, maxHeight: 55, alignment: .topLeading)
                }
                .multilineTextAlignment(.leading)
                Spacer()
            }
        }
        //.buttonStyle(BorderedButtonStyle())
        .padding(.top)
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
                item: ItemModel(title: "first and also long text for testing purpose", dueDate: Date.now, isCompleted: false))
            ListRowView(
                item: ItemModel(title: "second", dueDate: Date.now, isCompleted: true))
            ListRowView(
                item: ItemModel(title: "first", dueDate: Date.now, isCompleted: false))
            ListRowView(
                item: ItemModel(title: "first", dueDate: Date.now, isCompleted: true))
            ListRowView(
                item: ItemModel(title: "second", dueDate: Date.now, isCompleted: true))
        }
    }
}
