//
//  Tweet.swift
//  twittegorize
//
//  Created by 原口公輔 on 2019/11/24.
//  Copyright © 2019 Kosuke haraguchi. All rights reserved.
//

import Foundation

struct TweetObject: Identifiable, Decodable {
    let created_at: String
    let id: Int64
    let id_str: String
    let text: String
    let source: String
    let truncated: Bool
    let in_reply_to_status_id: Int64
    let in_reply_to_status_id_str: String
    let in_reply_to_user_id: Int64
    let in_reply_to_user_id_str: String
    let in_reply_to_screen_name: String
}

