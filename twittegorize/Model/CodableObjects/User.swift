//
//  UserObject.swift
//  twittegorize
//
//  Created by 原口公輔 on 2019/11/25.
//  Copyright © 2019 Kosuke haraguchi. All rights reserved.
//

import Foundation

struct User: Codable, Identifiable {
    let id: Int64
    let id_str: String
    let name: String
    let screen_name: String
    let location: String
    let profile_image_url_https: String
    let description: String
    let followers_count: Int
    let friends_count: Int
    let favourites_count: Int
    let statuses_count: Int
    let created_at: String
}

