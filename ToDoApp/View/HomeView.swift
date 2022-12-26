//
//  HomeView.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 23/12/22.
//

import SwiftUI

struct HomeView: View {
    @State private var tab:Int=0
    var body: some View {
        ZStack{
            TabView(selection: $tab) {
               ListView()
                    .tabItem {Label("ToDo", systemImage: "note.text")}
                    .tag(0)
                ProfileView()
                    .tabItem{Label("profile", systemImage: "person")}
                    .tag(1)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            HomeView()
        }
    }
}
