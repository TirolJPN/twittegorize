//
//  Tweet.swift
//  twittegorize
//
//  Created by 原口公輔 on 2019/10/21.
//  Copyright © 2019 Kosuke haraguchi. All rights reserved.
//

import Foundation

struct Tweet: Identifiable {
    let id: String
    
    let text: String
    
    let user: User
    
    let categoryId: String
}
