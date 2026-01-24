//
//  RegisterView.swift
//  ActivitiesForAppDev
//
//  Created by Ultiimate Dog on 23/01/26.
//

import SwiftUI

struct RegisterView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var country = "México"

    @State private var showAlert = false
    @State private var alertMessage = ""

    let countries = ["México", "Argentina", "España", "Chile"]

    var body: some View {
        VStack(spacing: 15) {

            Text("Register")
                .font(.title)
                .fontWeight(.semibold)

            TextField("Name", text: $name)
                .textFieldStyle(.roundedBorder)

            TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)

            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)

            Picker("Country", selection: $country) {
                ForEach(countries, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.menu)

            Button("Send") {
                validateForm()
            }
            .buttonStyle(.glassProminent)

            Spacer()
        }
        .padding()
        .alert("Error", isPresented: $showAlert) {
            
        } message: {
            Text(alertMessage)
        }
    }

    // MARK: - Validation
    private func validateForm() {
        if name.trimmingCharacters(in: .whitespaces).isEmpty {
            alertMessage = "Please enter your name."
            showAlert = true
            return
        }

        if !isValidEmail(email) {
            alertMessage = "Please enter a valid email address."
            showAlert = true
            return
        }

        if password.count < 6 {
            alertMessage = "Password must be at least 6 characters long."
            showAlert = true
            return
        }

        alertMessage = "Registration successful!"
        showAlert = true
    }

    private func isValidEmail(_ email: String) -> Bool {
        let regex = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: email)
    }
}

#Preview {
    RegisterView()
}
