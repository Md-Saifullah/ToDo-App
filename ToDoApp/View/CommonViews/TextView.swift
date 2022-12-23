//
//  TextView.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 22/12/22.
//

import SwiftUI

struct TextView: View {
    var title: String
    var fontSize: Font
    var fontWeight: Font.Weight
    init(title: String = "", fontSize: Font = .title3, fontWeight: Font.Weight = .semibold) {
        self.title = title
        self.fontSize = fontSize
        self.fontWeight = fontWeight
    }

    var body: some View {
        Text("\(title)")
            .font(fontSize)
            .fontWeight(fontWeight)
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView(title: "asdfgh")
    }
}
