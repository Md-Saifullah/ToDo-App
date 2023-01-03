//
//  MultiSpacer.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 22/12/22.
//

import SwiftUI

struct MultiSpacer: View {
    var count: Int = 0

    var body: some View {
        ForEach(0 ..< count, id: \.self) { _ in
            Spacer()
        }
    }
}

struct MultiSpacer_Previews: PreviewProvider {
    static var previews: some View {
        MultiSpacer(count: 1)
    }
}
