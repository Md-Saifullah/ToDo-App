//
//  TextFieldView.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 22/12/22.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var bindValue: String
    
    var title: String = ""
    
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
    static var previews: some View {
        TextFieldView(bindValue: .constant("hello"))
    }
}
