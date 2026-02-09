//
//  HeroViewModel.swift
//  ActivitiesForAppDev
//
//  Created by Ultiimate Dog on 09/02/26.
//

import Foundation
import SwiftUI

@MainActor @Observable
class HeroViewModel {
    
    var heroes: [Hero] = []
    var isLoading = false
    var hasSearched = false
    
    private let service = HeroService()
    
    func search(name: String) {
        guard !name.isEmpty else { return }
        
        Task {
            do {
                isLoading = true
                hasSearched = true
                heroes = try await service.searchHero(by: name)
                isLoading = false
            } catch {
                print("Error: \(error)")
                heroes = []
                isLoading = false
                hasSearched = true
            }
        }
    }
}

