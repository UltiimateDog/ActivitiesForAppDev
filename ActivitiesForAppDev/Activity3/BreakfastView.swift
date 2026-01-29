//
//  BreakfastView.swift
//  ActivitiesForAppDev
//
//  Created by Ultiimate Dog on 29/01/26.
//

import SwiftUI

struct BreakfastView: View {

    @State private var selectedTags: Set<DishTag> = []

    let breakfasts = [
        Dish(name: "Pancakes", tags: [.affordable, .chefRecommended]),
        Dish(name: "Oatmeal", tags: [.vegan, .affordable, .light]),
        Dish(name: "Omelette", tags: [.chefRecommended]),
        Dish(name: "Fruit with Yogurt", tags: [.vegan, .chefRecommended, .light])
    ]

    var filteredBreakfasts: [Dish] {
        breakfasts.filter {
            selectedTags.isSubset(of: $0.tags)
        }
    }

    var body: some View {
        VStack {
            filterSection([
                .vegan,
                .affordable,
                .chefRecommended
            ])

            List(filteredBreakfasts) { dish in
                DishRow(dish: dish)
            }
        }
        .navigationTitle("Breakfasts")
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
    BreakfastView()
}
