//
//  UserService.swift
//  iShop
//
//  Created by Deepanshu Jain on 13/06/23.
//

import Foundation
import FirebaseDatabase

class UserService {
    
    private static var user : User?
    private static var apiError = [APIError]()
    
//    static func get(completion : @escaping([User]?,[APIError]?)->Void){
//        let decoder = JSONDecoder()
//        UserRepository.get { data in
//            do{
//                self.user = try decoder.decode([User].self, from: data!)
//                self.apiError = try decoder.decode([APIError].self, from: data!)
//                completion(user,apiError)
//            }
//            catch{
//                print("Invalid data received",error)
//            }
//        }
//    }
    
    static func getByEmail(email:String, completion: @escaping (User?) ->Void){
        
        FirebaseService.getByChildValue(path: "users", child: "email", value: email, completion: { snapshot in
            user = parseData(snapshot: snapshot)
            completion(user)
        });
    }
    
    static func create(value: User){
        let user : [String:Any] = ["name": value.name , "password": value.password , "email": value.email ]
        FirebaseService.post(path: "users", value: user)
    }
    
    static private func parseData(snapshot : DataSnapshot?) -> User?{
        var userArray = [User]()
        if let snapshot = snapshot?.children.allObjects as? [DataSnapshot]{
            for snaps in snapshot{
                if let dict = snaps.value as? [String: Any]{
                    let name = dict["name"] as? String
                    let password = dict["password"] as? String
                    let email = dict["email"] as? String
//                    let id = dict["id"] as? Int
                    userArray.append(User(id: 0, name: name ?? "", email: email ?? "", password: password ?? ""))
                }
            }
        }
        return userArray.first
    }
}
