//
//  UserRepository.swift
//  iShop
//
//  Created by Deepanshu Jain on 13/06/23.
//

import Foundation

class UserRepository {
    
    static func get(completion: @escaping(Data?) -> Void) {
        
        let sessionDelegate = CustomURLSessionDelegate()
        var request = URLRequest(url: Global.userURL!)
        request.httpMethod = "GET"

        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: sessionDelegate, delegateQueue: nil)
        
        let dataTask = session.dataTask(with: request) { (data,response,error )in
            if error == nil && data != nil {
                completion(data)
            }
            else{
                print("Error while fetching data",error as Any)
            }
        }
        dataTask.resume()
    }
}
