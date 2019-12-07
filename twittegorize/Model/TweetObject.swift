//
//  Tweet.swift
//  twittegorize
//
//  Created by 原口公輔 on 2019/11/24.
//  Copyright © 2019 Kosuke haraguchi. All rights reserved.
//

import Foundation

class TweetObject: Codable, ObservableObject {
    @Published var created_at: String
    @Published var id: Int64
    @Published var id_str: String
    @Published var text: String
    @Published var source: String
    @Published var truncated: Bool
    
    init(created_at: String, id: Int64, id_str: String, text: String, source: String, truncated: Bool) {
        self.created_at = created_at
        self.id = id
        self.id_str = id_str
        self.text = text
        self.source = source
        self.truncated = truncated
    }
////    let in_reply_to_status_id: Int64
////    let in_reply_to_status_id_str: String
////    let in_reply_to_user_id: Int64
////    let in_reply_to_user_id_str: String
////    let in_reply_to_screen_name: String
//    let user: UserObject
////    let coordinates: Coordinates
////    let place: Places
////    let quoted_status: TweetObject
////    let retweeted_status: TweetObject
////    let quote_count: Int
////    let reply_count: Int
//    let retweet_count: Int
//    let favorite_count: Int
////    let entities: Entities
////    let extended_entities: Extended Entities
//    let favorited: Bool
//    let retweeted: Bool
////    let matching_rules: Array(Rule)
}

