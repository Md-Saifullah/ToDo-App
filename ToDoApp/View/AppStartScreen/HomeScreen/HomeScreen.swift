//
//  HomeScreen.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 23/12/22.
//

import SwiftUI

struct HomeScreen: View {
    @State private var tab: Int = 0
    var body: some View {
        TabView(selection: $tab) {
            ToDoListScreen()
                .tabItem { Label("ToDo", systemImage: "note.text") }
                .tag(0)

            ProfileScreen()
                .tabItem { Label("profile", systemImage: "person") }
                .tag(1)
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeScreen()
                .environmentObject(ListViewModel())
                .environmentObject(UserViewModel())
        }
    }
}
