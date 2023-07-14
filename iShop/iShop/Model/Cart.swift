//
//  Cart.swift
//  iShop
//
//  Created by Deepanshu Jain on 07/06/23.
//

import Foundation

class Cart {
    
    let id: Int
    let userId: Int
    let product: Product

    init(id: Int, userId: Int, product: Product) {
        self.id = id
        self.userId = userId
        self.product = product
    }
}
