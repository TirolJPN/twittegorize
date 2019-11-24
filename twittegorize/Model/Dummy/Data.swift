//
//  Data.swift
//  twittegorize
//
//  Created by 原口公輔 on 2019/10/30.
//  Copyright © 2019 Kosuke haraguchi. All rights reserved.
//

let tweetData: [Tweet] = tweetLoad()
let categoryData: [Category] = categoryLoad()

func tweetLoad() -> [Tweet] {
    let user = User(id: "1", screenName: "Tirol_JPN", name: "こうすけ", profileImageURL: "https://pbs.twimg.com/profile_images/1122848644225355777/3T_eJG72_400x400.jpg")
    
    var tweets = [Tweet]()
    
    for i in 0..<100 {
        tweets.append(
            Tweet(id: String(i), text: "テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト", user: user, categoryId: String(i % 3))
        )
    }
    return tweets
}

func categoryLoad() -> [Category] {
    let categories = [
        Category(id: "0", title: "名言", description: "後で見返したい名言集"),
        Category(id: "1", title: "おもしろ", description: "面白いツイート集"),
        Category(id: "2", title: "記事集", description: "ブクマと一緒に見たいツイート集")
    ]
    return categories
}
