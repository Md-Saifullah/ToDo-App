//
//  LogInScreen.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 21/12/22.
//

import SwiftUI

struct LogInScreen: View {
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
                CustomButtonView(title: "Sign Up", background: .green, action: signUpAction)
            }
            MultiSpacer(count: 3)
        }
        .alert("\(alertText)", isPresented: $showAlert, actions: {})
        .padding(30)
    }

    private func signUpAction() {
        if validateField() {
            let user = User(
                id: Int.random(in: 10000 ... 99999),
                name: name,
                email: email,
                gender: "male",
                status: "active")
            
            if !userViewModel.createUser(user){
                alertText="User already exists. Please use Log In"
                showAlert.toggle()
            }
        }
    }
    
    private func logInAction() {
        if validateField() {
            if !userViewModel.getUserBy(email) {
                alertText = "No user found. Please check Name and Email or Sign Up for new account"
                showAlert.toggle()
            }
        }
    }

    func validateField() -> Bool {
        if name.isEmpty || email.isEmpty {
            name.isEmpty ? (alertText = "Name Field can not be empty") : (alertText = "Email Field can not be empty")
            showAlert.toggle()
            return false
        }
        return true
    }
}

struct LogInScreen_Previews: PreviewProvider {
    static var previews: some View {
        LogInScreen()
    }
}
