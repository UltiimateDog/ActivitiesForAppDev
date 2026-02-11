//
//  ActivitiesForAppDevApp.swift
//  ActivitiesForAppDev
//
//  Created by Ultiimate Dog on 23/01/26.
//

import SwiftUI
import SwiftData

@main
struct ActivitiesForAppDevApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
