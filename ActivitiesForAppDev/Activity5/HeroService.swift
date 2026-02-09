//
//  HeroAPI.swift
//  ActivitiesForAppDev
//
//  Created by Ultiimate Dog on 09/02/26.
//

import Foundation

class HeroService {
    
    private let token = "397049c4f3dbdf010cb9ce33c89bad38"
    
    func searchHero(by name: String) async throws -> [Hero] {
        let query = name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let urlString = "https://superheroapi.com/api/\(token)/search/\(query)"
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let decoded = try JSONDecoder().decode(SearchResponse.self, from: data)
        
        return decoded.results ?? []
    }
}

