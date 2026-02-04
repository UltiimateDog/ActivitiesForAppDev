//
//  MainView.swift
//  ActivitiesForAppDev
//
//  Created by Ultiimate Dog on 29/01/26.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Spacer()

                Text("Main Menu")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                menuButton("🍳 Breakfasts") {
                    BreakfastView()
                }

                menuButton("🍽️ Main Dishes") {
                    MainDishesView()
                }

                menuButton("🍰 Desserts") {
                    DessertsView()
                }

                menuButton("🥤 Drinks") {
                    DrinksView()
                }

                Spacer()
            }
            .padding()
        }
    }

    // Reusable styled navigation button
    private func menuButton<Destination: View>(
        _ title: String,
        destination: @escaping () -> Destination
    ) -> some View {
        NavigationLink(destination: destination) {
            Text(title)
                .font(.headline)
                .frame(width: 220, height: 50)
                .foregroundColor(.white)
                .cornerRadius(12)
                .glassEffect(.regular.tint(.blue))
        }
    }
}


#Preview {
    MainView()
}
