//
//  HomeView.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 21/12/22.
//

import SwiftUI

struct AppStartView: View {
    @State var isLoggedIn: Bool = true
    var body: some View {
        ZStack {
            if isLoggedIn {
                HomeView()
                    .transition(AnyTransition.opacity.animation(.easeIn))

            } else {
                LogInView(isLoggedIn: $isLoggedIn)
                    .transition(AnyTransition.opacity.animation(.easeIn))
            }
        }
    }
}

struct AppStartView_Previews: PreviewProvider {
    static var previews: some View {
        AppStartView()
    }
}
