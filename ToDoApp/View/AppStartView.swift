//
//  HomeView.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 21/12/22.
//

import SwiftUI

struct AppStartView: View {
    @StateObject var listViewModel: ListViewModel = .init()
    @EnvironmentObject var userViewModel: UserViewModel

    var body: some View {
        ZStack {
            if userViewModel.user.isLoggedIn {
                HomeView()
                    .environmentObject(listViewModel)
            } else {
                LogInView()
            }
        }
    }
}

struct AppStartView_Previews: PreviewProvider {
    static var previews: some View {
        AppStartView()
            .environmentObject(ListViewModel())
            .environmentObject(UserViewModel())
    }
}
