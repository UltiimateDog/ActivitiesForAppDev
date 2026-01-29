//
//  DrinksView.swift
//  ActivitiesForAppDev
//
//  Created by Ultiimate Dog on 29/01/26.
//

import SwiftUI

struct DrinksView: View {

    @State private var selectedTags: Set<DishTag> = []

    let drinks = [
        Dish(name: "Coffee", tags: [.vegan, .affordable, .hot, .chefRecommended]),
        Dish(name: "Soda", tags: [.vegan, .affordable, .cold]),
        Dish(name: "Milkshake", tags: [.cold, .chefRecommended])
    ]

    var filteredDrinks: [Dish] {
        drinks.filter {
            selectedTags.isSubset(of: $0.tags)
        }
    }

    var body: some View {
        VStack {
            filterSection([
                .alcoholic,
                .hot,
                .chefRecommended
            ])

            List(filteredDrinks) { dish in
                DishRow(dish: dish)
            }
        }
        .navigationTitle("Drinks")
    }

    private func filterSection(_ tags: [DishTag]) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            ForEach(tags) { tag in
                tagToggle(tag)
            }
        }
        .padding()
    }

    private func tagToggle(_ tag: DishTag) -> some View {
        Toggle(
            tag.label,
            isOn: Binding(
                get: { selectedTags.contains(tag) },
                set: { isOn in
                    if isOn {
                        selectedTags.insert(tag)
                    } else {
                        selectedTags.remove(tag)
                    }
                }
            )
        )
    }
}


#Preview {
    DrinksView()
}
