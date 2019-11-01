//
//  Data.swift
//  twittegorize
//
//  Created by 原口公輔 on 2019/10/30.
//  Copyright © 2019 Kosuke haraguchi. All rights reserved.
//

//import UIKit
//import SwiftUI
//import CoreLocation

let tweetData: [Tweet] = load()

func load() -> [Tweet] {
    // ダミーデータの生成
    let user = User(id: "1", screenName: "Tirol_JPN", name: "こうすけ", profileImageURL: "https://pbs.twimg.com/profile_images/1122848644225355777/3T_eJG72_400x400.jpg")
    let tweet = Tweet(id: "01", text: "Twitterクライアント作成なう", user: user)
    let tmp = Tweet(id: "02", text: "テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト", user: user)
    let tweets = [tweet, tweet, tweet, tweet, tweet, tweet, tweet, tweet, tweet, tweet, tweet, tweet, tweet, tmp]
    return tweets
}

/*
let tweetData: [Tweet] = load("tweetsData.json")
func load<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
*/
