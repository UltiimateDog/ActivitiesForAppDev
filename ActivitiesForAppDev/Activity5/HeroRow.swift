//
//  HeroRow.swift
//  ActivitiesForAppDev
//
//  Created by Ultiimate Dog on 09/02/26.
//

import SwiftUI

struct HeroRow: View {
    
    let hero: Hero
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            
            AsyncImage(url: URL(string: hero.image.url)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading, spacing: 6) {
                
                Text(hero.name)
                    .font(.headline)
                
                Text("Gender: \(hero.appearance.gender ?? "N/A")")
                Text("Race: \(hero.appearance.race ?? "N/A")")
                Text("Publisher: \(hero.biography.publisher ?? "N/A")")
                
                Divider()
                
                Text("Powers:")
                    .font(.subheadline)
                    .bold()
                
                Text("🧠 Intelligence: \(hero.powerstats.intelligence ?? "-")")
                Text("💪 Strength: \(hero.powerstats.strength ?? "-")")
                Text("🥋 Combat: \(hero.powerstats.combat ?? "-")")
            }
            .font(.caption)
        }
        .padding(.vertical, 6)
    }
}


