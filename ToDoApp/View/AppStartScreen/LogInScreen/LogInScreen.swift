//
//  LogInScreen.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 21/12/22.
//

import SwiftUI

struct LogInScreen: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var showProgressView: Bool = false
    @State private var showAlert: Bool = false
    @State private var alertText: String = ""
    
    var body: some View {
        ScrollView {
            ZStack {
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
                .ignoresSafeArea(.keyboard)
                .alert("\(alertText)", isPresented: $showAlert, actions: {})
                .padding(30)
                
                if showProgressView {
                    Color.white.opacity(0.2)
                        .ignoresSafeArea()
                    ProgressView()
                }
            }
        }
        .scrollIndicators(.hidden)
    }

    private func signUpAction() {
        if validateField() {
            showProgressView.toggle()
            
            let user = User(
                id: Int.random(in: 10000 ... 99999),
                name: name,
                email: email,
                gender: "male",
                status: "active")
            
            userViewModel.createUser(user) { success, errors in
                showProgressView.toggle()
                
                if !success {
                    guard let errors = errors else {
                        alertText = "Failed!\nCheck your network"
                        showAlert.toggle()
                        return
                    }
                    
                    alertText = "\(errors.last?.field ?? "Unknown") \(errors.last?.message ?? "Error")"
                    showAlert.toggle()
                }
            }
        }
    }
    
    private func logInAction() {
        if validateField() {
            showProgressView.toggle()
            
            userViewModel.getUserBy(email) { bool in
                
                if !bool {
                    showProgressView.toggle()
                    alertText = "No user found. Please check Name and Email or Sign Up for new account"
                    showAlert.toggle()
                }
                else {
                    listViewModel.getItemsFromNetwork()
                    showProgressView.toggle()
                }
            }
        }
    }
    
    private func validateField() -> Bool {
        if name.isEmpty || !email.isValid {
            name.isEmpty ? (alertText = "Name Field can not be empty") : (alertText = "Invalid email")
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
