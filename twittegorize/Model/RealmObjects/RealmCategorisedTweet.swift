//
//  RealmCategorisedTweet.swift
//  twittegorize
//
//  Created by 原口公輔 on 2019/12/18.
//  Copyright © 2019 Kosuke haraguchi. All rights reserved.
//

import Foundation
import RealmSwift

class RealmCategorisedTweet: Object {
//    @objc dynamic var id: Int64 = -1
    
    @objc dynamic var category_id: Int = -1
    
    @objc dynamic var tweet_created_at: String = ""
    @objc dynamic var tweet_id: Int64 = -1
    @objc dynamic var tweet_id_str: String = ""
    @objc dynamic var tweet_text: String = ""
    @objc dynamic var tweet_source: String = ""
    @objc dynamic var tweet_truncated: Bool = false
    
//    @objc dynamic var user: User
    @objc dynamic var  user_id: Int64 = -1
    @objc dynamic var  user_id_str: String = ""
    @objc dynamic var  user_name: String = ""
    @objc dynamic var  user_screen_name: String = ""
    @objc dynamic var  user_location: String = ""
    @objc dynamic var  user_profile_image_url_https: String = ""
}
