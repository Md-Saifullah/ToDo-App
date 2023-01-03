//
//  AddItemScreen.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 23/12/22.
//

import SwiftUI

struct AddItemScreen: View {
    @EnvironmentObject var listViewModel: ListViewModel
    @Environment(\.dismiss) private var dismiss
    
    @State private var title: String = ""
    @State private var showAlert: Bool = false
    @State private var isCompleted: Bool = false
    @State private var dueDate: Date = .init()
    @State private var calendarId: Int = 0

    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 30) {
                MultiSpacer(count: 1)
                
                TextView(title: "Title:")
                
                TextFieldView(bindValue: $title, title: "Enter title")
                
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
                
                CustomButtonView(title: "SAVE", action: saveItem)
                
                MultiSpacer(count: 3)
            }
            .alert("Title can not be empty", isPresented: $showAlert, actions: {})
            .navigationTitle("Add an Item 🖊️")
            .padding(30)
        }
    }

    private func saveItem() {
        if title.isEmpty {
            showAlert.toggle()
        }
        else {
            listViewModel.addItem(Item(title: title, dueDate: dueDate, isCompleted: isCompleted))
            dismiss()
        }
    }
}

struct AddItemScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddItemScreen()
        }
    }
}
