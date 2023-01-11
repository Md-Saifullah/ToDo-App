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
        NavigationView {
            if userViewModel.user.status == "active" {
                withAnimation(.easeInOut) {
                    HomeScreen()
                        .navigationTitle("ToDo App 📝")
                }
            } else {
                withAnimation(.easeInOut) {
                    LogInScreen()
                }
            }
        }
        .environmentObject(listViewModel)
    }
}

struct AppStartScreen_Previews: PreviewProvider {
    static var previews: some View {
        AppStartScreen()
            .environmentObject(UserViewModel())
    }
}
