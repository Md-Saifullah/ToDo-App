//
//  EditItemView.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 22/12/22.
//

import SwiftUI

struct EditItemView: View {
    var item: Item
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var listViewModel: ListViewModel
    @State private var title: String = ""
    // @State private var description: String = ""
    @State private var isCompleted: Bool = false
    @State private var dueDate: Date = .init()
    @State private var calendarId: Int = 0

    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 30) {
                MultiSpacer(count: 1)
                TextView(title: "Title:")
                TextFieldView(title: "Enter title", bindValue: $title)

//                TextView(title: "Description:")
//                TextEditorView(bindValue: $description)

                DatePicker("Set Due Date", selection: $dueDate, in: Date() ... (Calendar.current.date(from: DateComponents(year: 2099)) ?? Date()), displayedComponents: [.date])
                    .id(calendarId)
                    .onChange(of: dueDate, perform: { _ in
                        calendarId += 1
                    })
                    .font(.title3)
                    .fontWeight(.semibold)

                Toggle(isOn: $isCompleted) {
                    TextView(title: "Status: \(isCompleted ? "Completed" : "Pending")")
                }

                HStack {
                    CustomButtonView(title: "DELETE", action: deleteItem, background: .red.opacity(0.8))
                    CustomButtonView(title: "UPDATE", action: updateItem)
                }
                MultiSpacer(count: 2)
            }
            .navigationTitle("Edit Item 🖊️")
            .padding(30)
        }
        .onAppear(perform: setScreen)
    }

    func setScreen() {
        title = item.title
        // description = item.description
        isCompleted = item.isCompleted
        dueDate = item.dueDate
    }

    func updateItem() {
        listViewModel.updateItem(Item(id: item.id, title: title, dueDate: dueDate, isCompleted: isCompleted))
        dismiss()
    }

    func deleteItem() {
        listViewModel.deleteItem(item)
        dismiss()
    }

    
}

struct EditItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EditItemView(item: Item(title: "first", dueDate: Date.now, isCompleted: false))
        }
    }
}
