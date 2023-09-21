//
//  Dish.swift
//  GroceriesHelper
//
//  Created by Juan Reyes on 9/4/23.
//

import Foundation

struct Dish: Codable {
    let id: Int
    let title: String
    let description: String?
    let ingredients: [Ingredient]?
}
