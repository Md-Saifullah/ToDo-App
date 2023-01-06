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
        if userViewModel.user.status == "active" {
            withAnimation(.easeInOut) {
                HomeScreen()
            }
        } else {
            withAnimation(.easeInOut) {
                LogInScreen()
            }
        }
    }
}

struct AppStartScreen_Previews: PreviewProvider {
    static var previews: some View {
        AppStartScreen()
            .environmentObject(UserViewModel())
    }
}
