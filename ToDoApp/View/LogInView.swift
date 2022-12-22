//
//  LogInView.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 21/12/22.
//

import SwiftUI

struct LogInView: View {
    @State var name: String = ""
    @State var email: String = ""
    @State var isEmailValid: Bool = false
    @State var showAlert: Bool = false
    @Binding var isLoggedIn: Bool
    @State var alertText: String = ""
    var body: some View {
        VStack {
            Spacer()
                
            LogoAndTitleView()
                    
            VStack(alignment: .leading) {
                TextView(title: "Name:")
                        
                TextFieldView(title: "Enter your full name",background: .secondary.opacity(0.2), bindValue: $name)
                    
                TextView(title: "Email:")
                        
                TextFieldView(title: "Enter your email",background: .secondary.opacity(0.2) , bindValue: $email)
                
                CustomButtonView(title: "Log In", action: logInAction)
            }
            MultiSpacer(count: 3)
        }
        .alert("\(alertText)", isPresented: $showAlert, actions: {})
        .padding(30)
    }
    
    func logInAction() {
        if name.isEmpty || email.isEmpty {
            name.isEmpty ? (alertText = "Name Field can not be empty") : (alertText = "Email Field can not be empty")
            showAlert.toggle()
        } else {
            isLoggedIn.toggle()
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView(isLoggedIn: .constant(true))
    }
}
