//
//  ProfileView.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 23/12/22.
//

import SwiftUI

struct ProfileView: View {
    var user: User
    var todoCount: Int = 30
    var body: some View {
        VStack {
            MultiSpacer(count: 2)
            RoundedRectangle(cornerRadius: 20)
                .fill(.background)
                // .foregroundColor(Color(UIColor.systemBackground))
                .frame(maxWidth: .infinity, maxHeight: 200)

                .shadow(color: .gray, radius: 3)
                .overlay {
                    // Color.gray.opacity(0.3)
                    VStack(alignment: .leading, spacing: 30) {
                        TextView(title: "Name:  \(user.name)", fontSize: .title)
                        TextView(title: "Email:  \(user.email)", fontSize: .headline)
                        TextView(title: "ToDo Count:  \(todoCount)", fontSize: .headline)
                        Spacer()
                    }
                    .padding(30)
                    .frame(maxWidth: .infinity)
                }
            MultiSpacer(count: 3)
            CustomButtonView(title: "Log Out", action: logOut)
        }
        .padding()
        .navigationTitle("Profile")
    }

    func logOut() {}
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProfileView(user: User(name: "Saifullah", email: "saifullah@softzino.com", isLogedIn: true))
        }
    }
}
