//
//  LogoAndTitleView.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 22/12/22.
//

import SwiftUI

struct LogoAndTitleView: View {
    var body: some View {
        Text("📝")
            .font(.system(size: 70))

        Text("ToDo App")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 40)
    }
}

struct LogoAndTitleView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            LogoAndTitleView()
        }
    }
}
