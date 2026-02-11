//
//  User.swift
//  ActivitiesForAppDev
//
//  Created by Ultiimate Dog on 11/02/26.
//

import Foundation
import SwiftData

@Model
class User: CustomDebugStringConvertible {
    var firstName: String
    var lastName: String
    var studentID: String
    var faculty: String
    var semester: String
    var gender: String
    var email: String
    var password: String
    
    init(firstName: String,
         lastName: String,
         studentID: String,
         faculty: String,
         semester: String,
         gender: String,
         email: String,
         password: String) {
        
        self.firstName = firstName
        self.lastName = lastName
        self.studentID = studentID
        self.faculty = faculty
        self.semester = semester
        self.gender = gender
        self.email = email
        self.password = password
    }
    
    var debugDescription: String {
            """
            User Debug Info:
            ---------------------------
            First Name: \(firstName)
            Last Name: \(lastName)
            Student ID: \(studentID)
            Faculty: \(faculty)
            Semester: \(semester)
            Gender: \(gender)
            Email: \(email)
            Password: \(password)
            ---------------------------
            """
    }
    
}

