//
//  HomeView.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 23/12/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack{
            Color(UIColor.systemBackground)
                .tabItem {
                    ListView()
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
