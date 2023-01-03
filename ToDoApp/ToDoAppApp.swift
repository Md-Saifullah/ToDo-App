//
//  ToDoAppApp.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 21/12/22.
//

import SwiftUI

@main
struct ToDoAppApp: App {
    @StateObject var userViewModel: UserViewModel = .init()

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                AppStartView()
            }
            .environmentObject(userViewModel)
        }
    }
}
