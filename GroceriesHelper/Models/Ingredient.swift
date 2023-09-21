//
//  Ingredient.swift
//  GroceriesHelper
//
//  Created by Juan Reyes on 9/4/23.
//

import Foundation

struct Ingredient: Codable {
    let id: Int
    let title: String
    let description: String?
    let locations: [Location]?
    let image: String?
}
