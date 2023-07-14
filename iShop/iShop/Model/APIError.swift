//
//  APIError.swift
//  iShop
//
//  Created by Deepanshu Jain on 16/06/23.
//

import Foundation

public class APIError : Codable
{
    let type : String
    let title : String
    let status : Int
    let traceId : String
    
    init(type: String, title: String, status: Int, traceId: String) {
        self.type = type
        self.title = title
        self.status = status
        self.traceId = traceId
    }
}
