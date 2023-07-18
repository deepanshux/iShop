//
//  SignUpViewModel.swift
//  iShop
//
//  Created by Deepanshu Jain on 12/07/23.
//

import Foundation

class SignUpViewModel : NSObject {
    
    var users : User?
    
    func signUpUser(request : SignUpRequest, completion: @escaping (SignUpResponse)->Void){
        
        let response = isValidRequest(request: request)
        if (response.status){
            UserService.getByEmail(email: request.email!, completion: { userData in
                if (userData != nil){
                    completion(self.alreadyExistUser())
                }
                else{
                    self.createUser(request: request)
                    completion(response)
                }
            })
        }
        else{
            completion(response)
        }
    }
    
    private func getUserData() {
        UserService.getByEmail(email: "", completion: { userData in
            self.users = userData
        })
    }
    
    private func createUser(request : SignUpRequest) {
        let user = User(id: 0, name: request.name!, email: request.email!, password: request.password!)
        UserService.create(value: user)
    }
    
    private func alreadyExistUser() -> SignUpResponse{
        let response = SignUpResponse()
        response.errorMessage = "The email address is already exist"
        return response
    }
    
    private func isValidRequest(request : SignUpRequest) -> SignUpResponse{
        
        let response = SignUpResponse()
        if (request.name != "" && request.password != "" && request.email != ""){
            if (request.password == request.confirmPass){
                response.status = true
                return response
            }
            else{
                response.errorMessage = "Password does not match"
                return response
            }
        }
        response.errorMessage = "Please fill all the details"
        return response
    }
}
