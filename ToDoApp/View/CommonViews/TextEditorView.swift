//
//  TextEditorView.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 22/12/22.
//

import SwiftUI

struct TextEditorView: View {
    @Binding var bindValue: String
    var body: some View {
        TextEditor(text: $bindValue)
            .frame(maxHeight: 200)
            .frame(maxWidth: .infinity)
            .cornerRadius(10)
            .shadow(color: .gray, radius: 6)
            .padding(.bottom)
    }
}

struct TextEditorView_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorView(bindValue: .constant("check"))
    }
}
