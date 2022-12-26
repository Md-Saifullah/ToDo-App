//
//  TextFieldView.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 22/12/22.
//

import SwiftUI

struct TextFieldView: View {
    var title: String = ""
    @Binding var bindValue: String
    var body: some View {
        TextField("\(title)", text: $bindValue)
            .autocorrectionDisabled(true)
            .textInputAutocapitalization(.never)
            .padding()
            .background(Color("Background"))
            .cornerRadius(10)
            .padding(.bottom)
            .shadow(color: .gray, radius: 4)
    }
}

 struct TextFieldView_Previews: PreviewProvider {
    static var bindedValue:String=""
    static var previews: some View {
        TextFieldView(bindValue: .constant("hello"))
    }
 }
