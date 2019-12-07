//
//  UserObject.swift
//  twittegorize
//
//  Created by 原口公輔 on 2019/11/25.
//  Copyright © 2019 Kosuke haraguchi. All rights reserved.
//

import Foundation

struct UserObject: Codable, ObservableObject {
    let id: Int64
    let id_str: String
    let name: String
    let screen_name: String
    let location: String
//    let url: String
    let description: String
//    let derived: Array<AnyClass>
//    let protected: Bool
//    let verified: Bool
    let followers_count: Int
    let friends_count: Int
//    let listed_count: Int
    let favourites_count: Int
    let statuses_count: Int
    let created_at: String
////    let utc_offset: null
////    let  time_zone: null
//    let geo_enabled: Bool
//    let lang: String
//    let contributors_enabled: Bool
//    let profile_background_color: String
//    let profile_background_image_url: String
//    let profile_background_image_url_https: String
//    let profile_background_tile: Bool
//    let profile_banner_url: String
//    let profile_image_url: String
//    let profile_image_url_https: String
//    let profile_link_color: String
//    let profile_sidebar_border_color: String
//    let profile_sidebar_fill_color: String
}

