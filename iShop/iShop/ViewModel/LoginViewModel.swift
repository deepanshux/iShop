//
//  LoginViewModel.swift
//  iShop
//
//  Created by Deepanshu Jain on 08/06/23.
//

import Foundation

class LoginViewModel {
    
    func loginUser(request : LoginRequest, completion: @escaping (Bool) -> Void){
        if (isValidRequest(request: request)){
            UserService.getByEmail(email: request.username!, completion: { data in
                completion(self.auth(request: request, user: data))
            })
        }
        else{
            completion(false)
        }
    }
    
    private func isValidRequest(request : LoginRequest) -> Bool{
        if (request.username != "" && request.password != ""){
            return true
        }
        return false
    }
    
    private func auth(request : LoginRequest, user : User?)->Bool{
        if (user?.email == request.username && user?.password == request.password){
            return true
        }
        return false
    }
    
}
