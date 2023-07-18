//
//  ProductService.swift
//  iShop
//
//  Created by Deepanshu Jain on 11/07/23.
//

import Foundation
import FirebaseDatabase

class ProductService {
    
    private static var products = [Product]()
    
    static func get(completion: @escaping ([Product]) ->Void){
        FirebaseService.get(path: "products", completion: { snapshot in
            products = parseData(snapshot: snapshot)
            completion(products)
        });
    }
    
    static func getByLimit(lastProductId:Int=0, completion: @escaping ([Product]) -> Void){
        FirebaseService.getByLimit(path: "products", limit: 10, id:lastProductId,completion: {snapshot in
            products = parseData(snapshot: snapshot)
            completion(products)
        })
    }
    
    private static func parseData(snapshot : DataSnapshot?) -> [Product]{
        var productArray = [Product]()
        
        if let snapshot = snapshot?.children.allObjects as? [DataSnapshot]{
            for snaps in snapshot{
                if let dict = snaps.value as? [String: Any]{
                    let title = dict["title"] as? String
                    let image = dict["image"] as? String
                    let id = dict["id"] as? Int
                    let price = dict["price"] as? Double
                    let description = dict["description"] as? String
                    
                    productArray.append(Product(id: id!, name: title!, description: description!, image: image!, price: price!))
                }
            }
        }
        return productArray
    }
}
