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
    @State var description: String = ""
    @State var isCompleted: Bool = false
    @State var dueDate: Date = .now

    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                MultiSpacer(count: 1)
                TextView(title: "Title:")
                TextFieldView(background: Color("Background"), bindValue: $title)
                    .shadow(color: .gray, radius: 6)

                TextView(title: "Description:")
                TextEditor(text: $description)
                    .frame(maxHeight: 200)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(10)
                    .shadow(color: .gray, radius: 6)
                    .padding(.bottom)
                CustomButtonView(title: "Update", action: updateItem)
                MultiSpacer(count: 3)
            }
            .navigationTitle("Add an Item 🖊️")
            .padding(30)
        }
        .onAppear(perform: setScreen)
    }
    
    func setScreen() {
        title = item.title
        description = item.description
        isCompleted = item.isCompleted
        dueDate = item.dueDate
    }
    
    func updateItem() {}
}

struct EditItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            EditItemView(item: ItemModel(title: "first", description: "first description", dueDate: Date.now, isCompleted: false))
        }
    }
}
