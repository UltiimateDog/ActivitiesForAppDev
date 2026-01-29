//
//  MainDishesView.swift
//  ActivitiesForAppDev
//
//  Created by Ultiimate Dog on 29/01/26.
//

import SwiftUI

struct MainDishesView: View {

    @State private var selectedTags: Set<DishTag> = []

    let dishes = [
        Dish(name: "Grilled Steak", tags: [.chefRecommended]),
        Dish(name: "Salad", tags: [.vegan, .affordable, .light]),
        Dish(name: "Grilled Chicken", tags: [.affordable, .chefRecommended]),
    ]

    var filteredDishes: [Dish] {
        dishes.filter {
            selectedTags.isSubset(of: $0.tags)
        }
    }

    var body: some View {
        VStack {
            filterSection([
                .vegan,
                .light,
                .chefRecommended
            ])

            List(filteredDishes) { dish in
                DishRow(dish: dish)
            }
        }
        .navigationTitle("Main Dishes")
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
    MainDishesView()
}
