//
//  InfoView.swift
//  ActivitiesForAppDev
//
//  Created by Ultiimate Dog on 11/02/26.
//

import SwiftUI
import SwiftData

struct InfoView: View {
    
    var user: User
    @Environment(\.modelContext) private var context
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            Text("First Name: \(user.firstName)")
            Text("Last Name: \(user.lastName)")
            Text("Student ID: \(user.studentID)")
            Text("Faculty: \(user.faculty)")
            Text("Semester: \(user.semester)")
            Text("Gender: \(user.gender)")
            Text("Email: \(user.email)")
            
            Spacer()
            
            Button("Log Out and Delete Data") {
                context.delete(user)
            }
            .foregroundColor(.red)
        }
        .padding()
        .navigationTitle("User Information")
    }
}


#Preview {
    InfoView(user: .init(firstName: "Test", lastName: "Test", studentID: "hbkjhbi", faculty: "none", semester: "5", gender: "male", email: "none@none.com", password: "nlsdnvnso"))
}
