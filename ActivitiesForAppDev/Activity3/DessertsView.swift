//
//  DessertsView.swift
//  ActivitiesForAppDev
//
//  Created by Ultiimate Dog on 29/01/26.
//

import SwiftUI

struct DessertsView: View {

    @State private var selectedTags: Set<DishTag> = []

    let desserts = [
        Dish(name: "Chocolate Cake", tags: [.chefRecommended]),
        Dish(name: "Gelatin", tags: [.vegan, .affordable, .sugarFree, .cold]),
        Dish(name: "Ice Cream", tags: [.affordable, .cold, .chefRecommended])
    ]

    var filteredDesserts: [Dish] {
        desserts.filter {
            selectedTags.isSubset(of: $0.tags)
        }
    }

    var body: some View {
        VStack {
            filterSection([
                .sugarFree,
                .cold,
                .chefRecommended
            ])

            List(filteredDesserts) { dish in
                DishRow(dish: dish)
            }
        }
        .navigationTitle("Desserts")
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
    DessertsView()
}
