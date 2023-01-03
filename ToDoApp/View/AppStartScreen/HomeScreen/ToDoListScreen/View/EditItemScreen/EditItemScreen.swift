//
//  EditItemScreen.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 22/12/22.
//

import SwiftUI

struct EditItemScreen: View {
    var item: Item

    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var listViewModel: ListViewModel

    @State private var title: String = ""
    @State private var alertText: String = ""
    @State private var titleAlert: Bool = false
    @State private var deleteAlert: Bool = false
    @State private var isCompleted: Bool = false
    @State private var dueDate: Date = .init()
    @State private var calendarId: Int = 0

    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            MultiSpacer(count: 1)

            TextView(title: "Title:")

            TextFieldView(bindValue: $title, title: "Enter title")

            DatePicker(
                "Set Due Date",
                selection: $dueDate,
                in: Date() ... (Calendar.current.date(from: DateComponents(year: 2099)) ?? Date()),
                displayedComponents: [.date])
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
                CustomButtonView(title: "DELETE", background: .red.opacity(0.8), action: deleteButtonPressed)

                CustomButtonView(title: "UPDATE", action: updateItem)
            }

            MultiSpacer(count: 2)
        }
        .padding(30)
        .alert(alertText, isPresented: $deleteAlert, actions: {
            Button("Cancel", action: {})

            Button("Ok", action: deleteItem)
        })
        .alert(alertText, isPresented: $titleAlert, actions: {})
        .onAppear(perform: setScreen)
        .navigationTitle("Edit Item 🖊️")
    }

    private func setScreen() {
        title = item.title
        isCompleted = item.isCompleted
        dueDate = item.dueDate
    }

    private func updateItem() {
        if title.isEmpty {
            alertText = "Title can not be empty"
            titleAlert.toggle()
        } else {
            listViewModel.updateItem(makeItem())
            dismiss()
        }
    }

    private func makeItem() -> Item {
        return Item(id: item.id, title: title, dueDate: dueDate, isCompleted: isCompleted)
    }

    private func deleteButtonPressed() {
        alertText = "Do you really want to delete?"
        deleteAlert.toggle()
    }

    private func deleteItem() {
        listViewModel.deleteItem(item)
        dismiss()
    }
}

struct EditItemScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EditItemScreen(item: Item(title: "first", dueDate: Date.now, isCompleted: false))
        }
        NavigationView {
            EditItemScreen(item: Item(title: "second", dueDate: Date.now + 20000000, isCompleted: true))
        }
    }
}
