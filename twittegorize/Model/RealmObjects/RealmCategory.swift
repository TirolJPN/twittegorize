//
//  Category.swift
//  twittegorize
//
//  Created by 原口公輔 on 2019/12/18.
//  Copyright © 2019 Kosuke haraguchi. All rights reserved.
//

import Foundation
import RealmSwift

class RealmCategory: Object {
    @objc dynamic var id: Int64 = -1
    @objc dynamic var title: String = ""
    @objc dynamic var detail: String = ""
    
    // A setting for primary key
    override static func primaryKey() -> String? {
        return "id"
    }
}
