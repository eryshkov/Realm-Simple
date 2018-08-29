//
//  Item.swift
//  Realm Simple
//
//  Created by Evgeniy Ryshkov on 29.08.2018.
//  Copyright © 2018 Evgeniy Ryshkov. All rights reserved.
//

import RealmSwift

class Item: Object {
    @objc dynamic var ID = 0
    @objc dynamic var textString = ""
    
    override static func primaryKey() -> String? {
        return "ID"
    }
}
