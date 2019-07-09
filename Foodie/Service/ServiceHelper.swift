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
    func addFoodie(foodie: Food, completion: (_ success: Bool)-> Void, failure: (_ fail: Bool)-> Void) {}
    func updateFoodie(foodie: Food, completion: (_ success: Bool)-> Void, failure: (_ fail: Bool)-> Void) {}
    func deleteFoodie(foodie: Food, completion: (_ success: Bool)-> Void, failure: (_ fail: Bool)-> Void) {}
}
