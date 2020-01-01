//
//  RealmTweets.swift
//  twittegorize
//
//  Created by 原口公輔 on 2019/12/18.
//  Copyright © 2019 Kosuke haraguchi. All rights reserved.
//

import Foundation
import RealmSwift

// RealmObjectでも取得したtweet_idを持っておく
class RealmTweet: Object {
    @objc dynamic var id: Int = -1
    @objc dynamic var tweet_id: Int64 = -1
}
