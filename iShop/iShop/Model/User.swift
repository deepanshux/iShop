//
//  User.swift
//  iShop
//
//  Created by Deepanshu Jain on 07/06/23.
//

import Foundation

class User : Codable {
    let id: Int
    let name: String
    let email: String
    let password: String
    
    init(id: Int, name: String, email: String, password: String) {
        self.id = id
        self.name = name
        self.email = email
        self.password = password
    }
}

class UserResponse {
    let user :User? = nil
    let error :APIError? = nil
}


