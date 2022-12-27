//
//  ProfileView.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 23/12/22.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @EnvironmentObject var listViewModel: ListViewModel

    var body: some View {
        NavigationView {
            VStack {
                // MultiSpacer(count: 2)
                Spacer()

//                TextView(title: "Profile:", fontSize: .largeTitle, fontWeight: .semibold)
//                    .frame(maxWidth: .infinity, alignment: .leading)

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
        }
    }

    func logOut() {
        // MARK: clear user Defaults

        withAnimation(.easeInOut) {
            userViewModel.clearUser()
        }
        listViewModel.clearItems()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProfileView()
        }
    }
}
