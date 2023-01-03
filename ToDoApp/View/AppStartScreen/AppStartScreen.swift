//
//  AppStartScreen.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 21/12/22.
//

import SwiftUI

struct AppStartScreen: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @StateObject var listViewModel: ListViewModel = .init()

    var body: some View {
        if userViewModel.user.isLoggedIn {
            HomeScreen()
                .environmentObject(listViewModel)
        } else {
            LogInScreen()
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
