//
//  SignUpViewModel.swift
//  iShop
//
//  Created by Deepanshu Jain on 12/07/23.
//

import Foundation

class SignUpViewModel : NSObject {
    
    var users : User?
    
    override init() {
        super.init()
        getUserData()
    }
    
    func signUpUser(request : SignUpRequest, completion: @escaping (Bool)->Void){
        if (isValidRequest(request: request)){
            completion(true)
        }
        else{
            completion(false)
        }
    }
    
    private func getUserData() {
        UserService.getByEmail(email: "", completion: { userData in
            self.users = userData
        })
    }
    
    private func checkAlreadyExistUser(){
        
    }
    
    private func isValidRequest(request : SignUpRequest) -> Bool{
        if (request.name != "" && request.password != "" && request.email != ""){
            if (request.password == request.confirmPass){
                return true
            }
        }
        return false
    }
}
