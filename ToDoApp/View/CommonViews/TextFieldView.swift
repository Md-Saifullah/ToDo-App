//
//  TextFieldView.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 22/12/22.
//

import SwiftUI

struct TextFieldView: View {
    var title: String = ""
    var background: Color
    @Binding var bindValue: String
    var body: some View {
        TextField("\(title)", text: $bindValue)
            .padding()
            .background(background)
            .cornerRadius(10)
            .padding(.bottom)
    }
}

 struct TextFieldView_Previews: PreviewProvider {
    static var bindedValue:String=""
    static var previews: some View {
        TextFieldView(background: .secondary.opacity(0.2), bindValue: .constant("hello"))
    }
 }
