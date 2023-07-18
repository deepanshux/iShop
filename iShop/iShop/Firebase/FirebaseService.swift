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
    private static var dataSnapShot : DataSnapshot?
    
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
    
    static func getByLimit(path:String, limit:Int, id:Int, completion : @escaping (DataSnapshot?) -> Void){
        let rootReference = databaseReference.reference(withPath: path)
        let query = getQueryForPagination(reference: rootReference, limit: UInt(limit), productId: id)
        
        query.observeSingleEvent(of: .value, with: {snapshot in
            dataSnapShot = snapshot
            completion(snapshot)
        })
    }
    
    static func post(path: String, value : Any){
        databaseReference.reference().child(path).childByAutoId().setValue(value)
        print("Data has been saved")
    }
    
    private static func getQueryForPagination(reference : DatabaseReference,limit:UInt, productId:Int) -> DatabaseQuery{
        var query : DatabaseQuery!
        if (dataSnapShot == nil) {
            query = reference.queryLimited(toFirst: limit)
        }
        else{
            query = reference.queryOrdered(byChild: "id").queryStarting(atValue: productId).queryLimited(toFirst: limit)
        }
        return query
    }
}
