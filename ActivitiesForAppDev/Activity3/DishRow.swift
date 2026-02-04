//
//  DishRow.swift
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

    // New properties (safe defaults)
    let description: String
    let price: Double
    let imageName: String

    init(
        name: String,
        tags: Set<DishTag>,
        description: String = "No description available.",
        price: Double = 0.0,
        imageName: String = "fork.knife"
    ) {
        self.name = name
        self.tags = tags
        self.description = description
        self.price = price
        self.imageName = imageName
    }
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

// MARK: - Row View
struct DishRow: View {
    let dish: Dish

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            // Dish image
            Image(systemName: dish.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 56, height: 56)
                .padding(8)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 12))

            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text(dish.name)
                        .font(.headline)

                    Spacer()

                    Text(dish.price, format: .currency(code: "USD"))
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }

                Text(dish.description)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)

                if !dish.tags.isEmpty {
                    Text(dish.tags.map(\.label).joined(separator: " • "))
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
        }
        .padding(.vertical, 6)
    }
}


#Preview {
    DishRow(
        dish: .init(
            name: "Vegan Bowl",
            tags: [.affordable, .vegan, .light],
            description: "Fresh vegetables with quinoa and tahini sauce.",
            price: 9.99,
            imageName: "leaf"
        )
    )
}

