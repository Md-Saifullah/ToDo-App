//
//  ProfileScreen.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 23/12/22.
//

import SwiftUI

struct ProfileScreen: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.background)
                    .frame(maxWidth: .infinity, maxHeight: 200)
                    .shadow(color: .gray, radius: 3)
                    .overlay {
                        VStack(alignment: .leading, spacing: 30) {
                            TextView(title: "Name:  \(userViewModel.user.name)", fontSize: .title)
                            
                            TextView(title: "Email:  \(userViewModel.user.email)", fontSize: .headline)
                            
                            TextView(title: "ToDo Count:  \(listViewModel.items.count)", fontSize: .headline)
                            
                            Spacer()
                        }
                        .padding(30)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                
                MultiSpacer(count: 3)
                
                CustomButtonView(title: "Log Out", action: logOut)
            }
            .padding()
            .navigationTitle("Profile:")
            .navigationBarTitleDisplayMode(.large)
        }
    }

    private func logOut() {
        withAnimation(.easeInOut) {
            userViewModel.clearUser()
        }
        listViewModel.clearItems()
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
            .environmentObject(ListViewModel())
            .environmentObject(UserViewModel())
    }
}
