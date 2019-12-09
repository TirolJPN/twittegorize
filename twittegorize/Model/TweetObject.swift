//
//  Tweet.swift
//  twittegorize
//
//  Created by 原口公輔 on 2019/11/24.
//  Copyright © 2019 Kosuke haraguchi. All rights reserved.
//

import Foundation

struct TweetObject: Codable {
    let created_at: String
    let id: Int64
    let id_str: String
    let text: String
    let source: String
    let truncated: Bool
    let user: UserObject
//    let coordinates: Coordinates
//    let place: Places
//    let quoted_status: TweetObject
//    let retweeted_status: TweetObject
    let retweet_count: Int
    let favorite_count: Int
//    let entities: Entities
//    let extended_entities: Extended Entities
    let favorited: Bool
    let retweeted: Bool
//    let matching_rules: Array(Rule)
}

