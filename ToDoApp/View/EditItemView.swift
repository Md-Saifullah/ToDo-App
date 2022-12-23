//
//  EditItemView.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 22/12/22.
//

import SwiftUI

struct EditItemView: View {
    var item: ItemModel
    @State var title: String = ""
    //@State var description: String = ""
    @State var isCompleted: Bool = false
    @State var dueDate: Date = .init()

    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 30) {
                MultiSpacer(count: 1)
                TextView(title: "Title:")
                TextFieldView(bindValue: $title)

//                TextView(title: "Description:")
//                TextEditorView(bindValue: $description)

                DatePicker("Set Due Date", selection: $dueDate, in: Date() ... (Calendar.current.date(from: DateComponents(year: 2099)) ?? Date()), displayedComponents: [.date])
                    .font(.title3)
                    //.fontWeight(.semibold)

                // Toggle("Status: \(isCompleted ? "Completed" : "Pending")", isOn: $isCompleted)

                Toggle(isOn: $isCompleted) {
                    TextView(title: "Status: \(isCompleted ? "Completed" : "Pending")")
                }
                //MultiSpacer(count: 1)
                HStack {
                    CustomButtonView(title: "DELETE", action: deleteItem,background: .red.opacity(0.8))
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

    func updateItem() {}
    func deleteItem() {}
}

struct EditItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EditItemView(item: ItemModel(title: "first", dueDate: Date.now, isCompleted: false))
        }
    }
}
