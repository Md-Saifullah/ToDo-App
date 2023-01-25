//
//  CustomButtonView.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 22/12/22.
//

import SwiftUI

struct CustomButtonView: View {
    private var title: String
    private var action: () -> Void
    private var background: Color

    init(title: String = "Button", background: Color = Color("ButtonBackground"), action: @escaping () -> Void = {}) {
        self.title = title
        self.action = action
        self.background = background
    }

    var body: some View {
        Button(action: action) {
            TextView(title: title)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, minHeight: 55, maxHeight: 55)
                .background(background)
                .cornerRadius(10)
        }
    }
}

struct CustomButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonView(title: "CustomButton", action: {})
    }
}
