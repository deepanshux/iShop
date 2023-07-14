//
//  Firebase.swift
//  iShop
//
//  Created by Deepanshu Jain on 06/07/23.
//

import Foundation
import FirebaseCore
import FirebaseDatabase

class FirebaseService {
    
    private static let databaseReference = Database.database()
    
    static func get(path: String, completion: @escaping (DataSnapshot?) -> Void ){
        
        databaseReference.reference(withPath: path).getData(completion: {error, snapshot in
            guard error == nil else{
                print("Error occured while fetching data from Firebase :",error!.localizedDescription)
                return;
            }
            completion(snapshot)
        });
    }
    
    static func getByChildValue(path: String, child:String, value:String, completion: @escaping (DataSnapshot?) -> Void ){
        
        let rootReference = databaseReference.reference(withPath: path)
        let reference = rootReference.queryOrdered(byChild: child).queryEqual(toValue: value)
        
        reference.observeSingleEvent(of: .value, with: { snapshot in
            completion(snapshot)
        })
    }
    
    static func post(path: String, value : Any){
        databaseReference.reference().child(path).childByAutoId().setValue(value)
        print("Data has been saved")
    }
}
