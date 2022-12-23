//
//  AddItemView.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 23/12/22.
//

import SwiftUI

struct AddItemView: View {
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
                    .fontWeight(.semibold)

               //Toggle("Status: \(isCompleted ? "Completed" : "Pending")", isOn: $isCompleted)

                Toggle(isOn: $isCompleted) {
                    TextView(title: "Status: \(isCompleted ? "Completed" : "Pending")")
                }

                CustomButtonView(title: "SAVE", action: saveItem)

                MultiSpacer(count: 3)
            }
            .navigationTitle("Add an Item 🖊️")
            .padding(30)
        }
    }

    func saveItem() {}
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AddItemView()
        }
    }
}
