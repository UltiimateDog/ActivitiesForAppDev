//
//  LoginView.swift
//  ActivitiesForAppDev
//
//  Created by Ultiimate Dog on 11/02/26.
//

import SwiftUI

struct LoginView: View {
    
    var user: User
    
    @State private var email = ""
    @State private var password = ""
    @State private var loginSuccess = false
    @State private var showError = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                TextField("Email", text: $email)
                    .textFieldStyle(.roundedBorder)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                
                Button("Login") {
                    if email == user.email && password == user.password {
                        loginSuccess = true
                    } else {
                        showError = true
                    }
                }
                
                if showError {
                    Text("Incorrect email or password")
                        .foregroundColor(.red)
                }
            }
            .padding()
            .navigationTitle("Login")
            .navigationDestination(isPresented: $loginSuccess) {
                InfoView(user: user)
            }
        }
    }
}


#Preview {
    LoginView(user: .init(firstName: "Test", lastName: "Test", studentID: "hbkjhbi", faculty: "none", semester: "5", gender: "male", email: "none@none.com", password: "nlsdnvnso"))
}
