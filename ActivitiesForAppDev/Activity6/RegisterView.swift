//
//  RegisterView.swift
//  ActivitiesForAppDev
//
//  Created by Ultiimate Dog on 11/02/26.
//

import SwiftUI
import SwiftData

struct RegisterView: View {
    
    @Environment(\.modelContext) private var context
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var studentID = ""
    @State private var faculty = ""
    @State private var semester = ""
    @State private var gender = ""
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $lastName)
                TextField("Student ID", text: $studentID)
                TextField("Faculty", text: $faculty)
                TextField("Semester", text: $semester)
                TextField("Gender", text: $gender)
                TextField("Email", text: $email)
                SecureField("Password", text: $password)
                
                Button("Save") {
                    let newUser = User(
                        firstName: firstName,
                        lastName: lastName,
                        studentID: studentID,
                        faculty: faculty,
                        semester: semester,
                        gender: gender,
                        email: email,
                        password: password
                    )
                    
                    context.insert(newUser)
                }
            }
            .navigationTitle("Register")
        }
    }
}


#Preview {
    RegisterView()
}
