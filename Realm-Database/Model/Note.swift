//
//  Note.swift
//  Realm-Database
//
//  Created by Giuseppe Sapienza on 03/04/2019.
//  Copyright © 2019 Giuseppe Sapienza. All rights reserved.
//

import Foundation
import RealmSwift

class Note: Object {
    @objc dynamic var title: String?
    @objc dynamic var text: String?
    @objc dynamic var date: Date?
}
