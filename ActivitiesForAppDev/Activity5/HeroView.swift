//
//  HeroView.swift
//  ActivitiesForAppDev
//
//  Created by Ultiimate Dog on 09/02/26.
//

import SwiftUI

struct HeroView: View {
    
    @State private var viewModel = HeroViewModel()
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                
                HStack {
                    TextField("Search hero...", text: $searchText)
                        .textFieldStyle(.roundedBorder)
                    
                    Button("Search") {
                        viewModel.search(name: searchText)
                    }
                }
                .padding()
                
                if viewModel.isLoading {
                    ProgressView()
                    
                    Spacer()
                }
                else if viewModel.hasSearched && viewModel.heroes.isEmpty {
                    VStack(spacing: 10) {
                        Image(systemName: "magnifyingglass")
                            .font(.largeTitle)
                            .foregroundColor(.gray)
                        
                        Text("No heroes found.")
                            .font(.headline)
                        
                        Text("Try searching with another name.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Spacer()
                    }
                    .padding()
                }
                else {
                    List(viewModel.heroes) { hero in
                        HeroRow(hero: hero)
                    }
                }
            }
            .navigationTitle("Superheroes")
        }
    }
}




#Preview {
    HeroView()
}
