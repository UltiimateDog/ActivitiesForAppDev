//
//  MainView.swift
//  ActivitiesForAppDev
//
//  Created by Ultiimate Dog on 29/01/26.
//

import SwiftUI

// MARK: - Model

struct Dish: Identifiable {
    let id = UUID()
    let name: String
    let tags: Set<DishTag>
}

enum DishTag: String, CaseIterable, Identifiable {
    case vegan
    case affordable
    case chefRecommended
    case spicy
    case hot
    case cold
    case sugarFree
    case alcoholic
    case light

    var id: String { rawValue }

    var label: String {
        switch self {
        case .vegan: return "🌱 Vegan"
        case .affordable: return "💰 Affordable"
        case .chefRecommended: return "👨‍🍳 Chef’s Pick"
        case .spicy: return "🌶️ Spicy"
        case .hot: return "🔥 Hot"
        case .cold: return "❄️ Cold"
        case .sugarFree: return "🍯 Sugar-Free"
        case .alcoholic: return "🍺 Alcoholic"
        case .light: return "🥗 Light"
        }
    }
}

// MARK: - Main View
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

// MARK: - Helper
struct DishRow: View {
    let dish: Dish

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(dish.name)
                .font(.headline)

            Text(dish.tags.map(\.label).joined(separator: " • "))
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
}


#Preview {
    MainView()
}
