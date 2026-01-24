//
//  HomeView.swift
//  ActivitiesForAppDev
//
//  Created by Ultiimate Dog on 23/01/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Spacer()
                
                Text("My App")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                    .shadow(radius: 3, y: 3)

                NavigationLink("Register", destination: RegisterView())
                    .foregroundColor(.white)
                    .buttonStyle(.glassProminent)
                
                Spacer()
                
                NavigationLink("App Info", destination: InfoView())
                    .foregroundColor(.white)
                    .buttonStyle(.glassProminent)
            }
            .padding()
        }
    }
}


#Preview {
    HomeView()
}
