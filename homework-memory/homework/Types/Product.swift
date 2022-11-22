//
//  Product.swift
//  homework
//
//  Created by Nita Horia on 16.11.2022.
//

import Foundation

struct Product: Identifiable {
    var id: String = UUID().uuidString
    var category: String
    var image: String
    var price: Float
    var title: String
    var popularity: Int
    var quantityLeft: Int
}
