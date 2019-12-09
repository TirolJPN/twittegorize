//
//  Tweet.swift
//  twittegorize
//
//  Created by 原口公輔 on 2019/11/24.
//  Copyright © 2019 Kosuke haraguchi. All rights reserved.
//

import Foundation

struct Tweet: Codable, Identifiable  {
    let created_at: String
    let id: Int64
    let id_str: String
    let text: String
    let source: String
    let truncated: Bool
    let user: User
    let retweet_count: Int
    let favorite_count: Int
    let favorited: Bool
    let retweeted: Bool
}
