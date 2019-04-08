//
//  User.swift
//  Realm-Database
//
//  Created by Giuseppe Sapienza on 03/04/2019.
//  Copyright © 2019 Giuseppe Sapienza. All rights reserved.
//

import Foundation
import RealmSwift


class User: Object {
    @objc dynamic var name: String?
    @objc dynamic var surname: String?
    
    @objc dynamic var age: Int = 0
    
    //var age: RealmOptional<Int> = RealmOptional<Int>()
    
    @objc dynamic var preferences: Preferences?
    var note: List<Note> = List<Note>()
}

/*
 SUPPORTED TYPE
 
 Optional:
 - Bool, Int, Double, Float -> RealmOptional<Int>
 - String, Date, and Data
 - Object Type
 
 Non Optional:
 - List<Type> -> Senza @objc dynamic
 
 */
