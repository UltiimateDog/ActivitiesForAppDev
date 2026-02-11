//
//  ContentView.swift
//  ActivitiesForAppDev
//
//  Created by Ultiimate Dog on 23/01/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Query var users: [User]
    
    var body: some View {
        if users.isEmpty {
            RegisterView()
        } else {
            LoginView(user: users.first!)
                .onAppear {
                    print(users)
                }
        }
    }
}


#Preview {
    ContentView()
        .modelContainer(for: User.self)
}
