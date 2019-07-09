//
//  ServiceHelper.swift
//  Foodie
//
//  Created by Tifo Audi Alif Putra on 07/07/19.
//  Copyright © 2019 BCC FILKOM. All rights reserved.
//

import Foundation
import RealmSwift

class ServiceHelper {
    
    //singleton declaration
    static let shared = ServiceHelper()
    
    //helper function
    func addFoodie(foodie: Food, completion: (_ success: Bool)-> Void, failure: (_ fail: Bool)-> Void) {
        let realm = try! Realm()
        try! realm.write { realm.add(foodie) }
        completion(true)
    }
    
    func updateFoodie(foodie: Food, newName: String, newOwner: String, completion: (_ success: Bool)-> Void) {
        let realm = try! Realm()
        try! realm.write {
            foodie.name = newName
            foodie.owner = newOwner
        }
        completion(true)
    }
    
    func deleteFoodie(foodie: Food, completion: (_ success: Bool)-> Void, failure: (_ fail: Bool)-> Void) {
        let realm = try! Realm()
        try! realm.write { realm.delete(foodie) }
        completion(true)
    }
}
