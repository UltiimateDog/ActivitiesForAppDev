//
//  Hero.swift
//

import Foundation

// MARK: - Search Response
struct SearchResponse: Codable {
    let response: String
    let results: [Hero]?
    
    enum CodingKeys: String, CodingKey {
        case response
        case results
    }
}

// MARK: - Hero
struct Hero: Codable, Identifiable {
    let id: String
    let name: String
    let biography: Biography
    let appearance: Appearance
    let powerstats: Powerstats
    let image: HeroImage
}

// MARK: - Biography
struct Biography: Codable {
    let fullName: String?
    let publisher: String?
    
    enum CodingKeys: String, CodingKey {
        case fullName = "full-name"
        case publisher
    }
}

// MARK: - Appearance
struct Appearance: Codable {
    let gender: String?
    let race: String?
}

// MARK: - Powerstats
struct Powerstats: Codable {
    let intelligence: String?
    let strength: String?
    let speed: String?
    let durability: String?
    let power: String?
    let combat: String?
}

// MARK: - Image
struct HeroImage: Codable {
    let url: String
}
