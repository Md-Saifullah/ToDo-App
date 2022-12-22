//
//  TextView.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 22/12/22.
//

import SwiftUI

struct TextView: View {
    var title: String = ""
    var body: some View {
        Text("\(title)")
            .font(.title3)
            .fontWeight(.semibold)
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView()
    }
}
