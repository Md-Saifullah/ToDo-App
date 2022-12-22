//
//  CustomButtonView.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 22/12/22.
//

import SwiftUI

struct CustomButtonView: View {
    var title: String = ""
    var action: () -> Void
    var body: some View {
        Button(action: action) {
            TextView(title: title)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: 55)
                .background(Color("ButtonBackground"))
                .cornerRadius(10)
        }
    }
}

// struct CustomButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomButtonView()
//    }
// }
