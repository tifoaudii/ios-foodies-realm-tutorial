//
//  Food.swift
//  Foodie
//
//  Created by Tifo Audi Alif Putra on 07/07/19.
//  Copyright © 2019 BCC FILKOM. All rights reserved.
//

import Foundation
import RealmSwift

class Food: Object {
    
    //Properties declaration
    @objc dynamic var name = ""
    @objc dynamic var owner = ""
}
