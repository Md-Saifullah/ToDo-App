//
//  AppStartScreen.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 21/12/22.
//

import SwiftUI

struct AppStartScreen: View {
    @EnvironmentObject var userViewModel: UserViewModel

    var body: some View {
        ZStack {
            if userViewModel.user.isLoggedIn {
                HomeScreen()

            } else {
                LogInScreen()
            }
        }
    }
}

struct AppStartScreen_Previews: PreviewProvider {
    static var previews: some View {
        AppStartScreen()
            .environmentObject(ListViewModel())
            .environmentObject(UserViewModel())
    }
}
