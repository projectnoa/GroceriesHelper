//
//  Grocerie.swift
//  GroceriesHelper
//
//  Created by Juan Reyes on 9/18/23.
//

import Foundation

struct Item: Codable {
    let id: Int
    let title: String
    let description: String?
    let locations: [Location]?
    let image: String?
    let amount: String
}
