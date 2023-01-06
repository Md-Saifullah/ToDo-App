//
//  HomeScreen.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 23/12/22.
//

import SwiftUI

struct HomeScreen: View {
    @State private var tab: Int = 0
    @StateObject var listViewModel: ListViewModel = .init()
    var body: some View {
        TabView(selection: $tab) {
            ToDoListScreen()
                //.environmentObject(listViewModel)
                .tabItem { Label("ToDo", systemImage: "note.text") }
                .tag(0)

            ProfileScreen()
                //.environmentObject(listViewModel)
                .tabItem { Label("profile", systemImage: "person") }
                .tag(1)
        }
        .environmentObject(listViewModel)
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
