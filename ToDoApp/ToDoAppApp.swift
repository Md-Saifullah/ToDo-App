//
//  ToDoAppApp.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 21/12/22.
//

import SwiftUI

@main
struct ToDoAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject var userViewModel: UserViewModel = .init()

    var body: some Scene {
        WindowGroup {
            AppStartScreen()
                .environmentObject(userViewModel)
        }
    }
}
