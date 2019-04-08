//
//  Preferences.swift
//  Realm-Database
//
//  Created by Giuseppe Sapienza on 03/04/2019.
//  Copyright © 2019 Giuseppe Sapienza. All rights reserved.
//

import Foundation
import RealmSwift

class Preferences: Object {
    @objc dynamic var darkMode: Bool = false
    @objc dynamic var notification: Bool = false
}
