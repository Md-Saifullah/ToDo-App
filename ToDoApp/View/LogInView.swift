//
//  LogInView.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 21/12/22.
//

import SwiftUI

struct LogInView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var isLoggedIn: Bool = false
    @State private var isEmailValid: Bool = false
    @State private var showAlert: Bool = false
    @State private var alertText: String = ""
    
    var body: some View {
        VStack {
            Spacer()
                
            LogoAndTitleView()
                    
            VStack(alignment: .leading) {
                TextView(title: "Name:")
                        
                TextFieldView(bindValue: $name, title: "Enter your full name")
                    
                TextView(title: "Email:")
                        
                TextFieldView(bindValue: $email, title: "Enter your email")
                
                CustomButtonView(title: "Log In", action: logInAction)
            }
            MultiSpacer(count: 3)
        }
        .alert("\(alertText)", isPresented: $showAlert, actions: {})
        .padding(30)
    }
    
    private func logInAction() {
        if name.isEmpty || email.isEmpty {
            name.isEmpty ? (alertText = "Name Field can not be empty") : (alertText = "Email Field can not be empty")
            showAlert.toggle()
        } else {
            withAnimation(.easeInOut) {
                userViewModel.setUser(User(name: name, email: email, isLoggedIn: !isLoggedIn))
            }
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
