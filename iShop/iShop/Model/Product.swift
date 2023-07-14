//
//  Product.swift
//  iShop
//
//  Created by Deepanshu Jain on 07/06/23.
//

import Foundation

class Product {
    
    let id: Int
    let name: String
    let description: String
    let image: String
    let price : Double

    init(id: Int, name: String, description: String, image: String, price:Double) {
        self.id = id
        self.name = name
        self.description = description
        self.image = image
        self.price = price
    }
}
