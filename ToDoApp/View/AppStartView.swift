//
//  HomeView.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 21/12/22.
//

import SwiftUI

struct AppStartView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    var body: some View {
        ZStack {
            if userViewModel.user.isLoggedIn {
                HomeView()
                    .transition(AnyTransition.opacity.animation(.easeIn))

            } else {
                LogInView()
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
