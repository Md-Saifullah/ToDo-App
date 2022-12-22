//
//  HomeView.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 21/12/22.
//

import SwiftUI

struct HomeView: View {
    @State var isLoggedIn: Bool = false
    var body: some View {
        ZStack{
            if isLoggedIn {
                ListView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                LogInView(isLoggedIn: $isLoggedIn)
                    .transition(AnyTransition.opacity.animation(.easeIn))
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
