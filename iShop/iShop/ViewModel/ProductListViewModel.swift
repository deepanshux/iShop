//
//  ProductListViewModel.swift
//  iShop
//
//  Created by Deepanshu Jain on 08/06/23.
//

import Foundation

class ProductListViewModel : NSObject {

    var bindProductViewModelToController : (() -> ()) = {}
    
    private(set) var products : [Product]! {
        didSet {
            self.bindProductViewModelToController()
        }
    }
    
    override init() {
        super.init()
        getProducts()
    }
    
    private func getProducts(){
        ProductService.get(completion: { products in
            self.products = products
        })
    }
}
