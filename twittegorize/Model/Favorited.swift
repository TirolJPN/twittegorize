//
//  Tweet.swift
//  twittegorize
//
//  Created by 原口公輔 on 2019/11/24.
//  Copyright © 2019 Kosuke haraguchi. All rights reserved.
//

import Foundation

struct Favorited: Identifiable, Decodable {
    let id: String
    let text: String
    let categoryId: String
}

