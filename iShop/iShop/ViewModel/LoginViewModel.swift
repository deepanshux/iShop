//
//  LoginViewModel.swift
//  iShop
//
//  Created by Deepanshu Jain on 08/06/23.
//

import Foundation

class LoginViewModel {
    
    func loginUser(request : LoginRequest, completion: @escaping (LoginResponse) -> Void){
        
        if (isValidRequest(request: request)){
            UserService.getByEmail(email: request.username!, completion: { data in
                let response = self.auth(request: request, user: data)
                completion(response)
            })
        }
        else{
            let response = LoginResponse(user: nil, status: false, errorMessage: Global.EmptyErrorMessage)
            completion(response)
        }
    }
    
    private func isValidRequest(request : LoginRequest) -> Bool{
        if (request.username != "" && request.password != ""){
            return true
        }
        return false
    }
    
    private func auth(request : LoginRequest, user : User?)->LoginResponse{
        if (user?.email == request.username && user?.password == request.password){
            return LoginResponse(user: user, status: true, errorMessage: "NULL")
        }
        return LoginResponse(user: user, status: false, errorMessage: Global.IncorrectErrorMessage)
    }
    
}
