//
//  TextEditorView.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 22/12/22.
//

import SwiftUI

struct TextEditorView: View {
    init() {
        UITextView.appearance().backgroundColor = .clear // First, remove the UITextView's backgroundColor.
    }
    @State private var input = ""
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            TextEditor(text: $input)
                .frame(width:350, height: 200)
                .font(.body)
                //.foregroundColor(.white) // Text color
                .background(Color.blue) // TextEditor's Background Color
        }
    }
}

struct TextEditorView_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorView()
    }
}
