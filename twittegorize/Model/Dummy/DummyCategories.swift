//
//  Data.swift
//  twittegorize
//
//  Created by 原口公輔 on 2019/10/30.
//  Copyright © 2019 Kosuke haraguchi. All rights reserved.
//

import Foundation

struct Category: Identifiable {
    let id: String
    
    let title: String
    
    let description: String
}

func categoryLoad() -> [Category] {
    let categories = [
        Category(id: "0", title: "名言", description: "後で見返したい名言集"),
        Category(id: "1", title: "おもしろ", description: "面白いツイート集"),
        Category(id: "2", title: "記事集", description: "ブクマと一緒に見たいツイート集")
    ]
    return categories
}

let dummyCategories: [Category] = categoryLoad()

final class DummyData: ObservableObject {
    @Published var categories = dummyCategories
}
