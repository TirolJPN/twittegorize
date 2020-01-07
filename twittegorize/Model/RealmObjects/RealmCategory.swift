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
    // uuidをデフォルト値とするユニークなString型のID
    @objc dynamic var id: String = NSUUID().uuidString
    @objc dynamic var title: String = ""
    @objc dynamic var detail: String = ""
    
    // A setting for primary key
    override static func primaryKey() -> String? {
        return "id"
    }
}

class MyRealmCategory {
    func createRealmCategory(title: String, detail: String) {
        let realmCategory = RealmCategory()
        realmCategory.title = title
        realmCategory.detail = detail
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(realmCategory)
        }
    }
    
    func createDummyRealmCategory() {
        let realmCategory = RealmCategory()
        realmCategory.title = "dummy category " + realmCategory.id
        realmCategory.detail = "dummy detail" + realmCategory.id
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(realmCategory)
        }
    }
}
