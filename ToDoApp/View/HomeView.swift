//
//  HomeView.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 23/12/22.
//

import SwiftUI

struct HomeView: View {
    @State var tab:Int=0
    var body: some View {
        ZStack{
            TabView(selection: $tab) {
                
               ListView()
                    .tabItem {Label("ToDo", systemImage: "person")}
                    .tag(0)
                    
                ProfileView(user: User(name: "Saifullah", email: "saifullah@softzino.com", isLogedIn: true))
                    .tabItem{Label("profile", systemImage: "person")}
                    .tag(1)
            }
            // MARK: tab to be hide for edit
            //.hidden()
            //.accentColor(.gray)
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
