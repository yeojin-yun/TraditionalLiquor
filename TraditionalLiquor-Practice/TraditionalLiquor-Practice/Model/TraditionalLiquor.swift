//
//  TraditionalLiquor.swift
//  TraditionalLiquor-Practice
//
//  Created by 순진이 on 2022/12/30.
//

import Foundation

struct TraditionalLiquor: Codable {
    let liquorName: String
    let percentageOfAlcohol: Double
    let volume, mainIngredient, manufacturer: String
}

struct Results: Codable {
    let lastBuildDate: String
    let total, start, display: Int
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let title: String
    let link: String
    let itemDescription: String
    let thumbnail: String

    enum CodingKeys: String, CodingKey {
        case title, link
        case itemDescription = "description"
        case thumbnail
    }
}

enum NetworkError: Error {
    case networkingError
    case dataError
    case parseError
}
