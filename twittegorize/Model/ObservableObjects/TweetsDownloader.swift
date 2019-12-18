//
//  TweetsDownloader.swift
//  twittegorize
//
//  Created by 原口公輔 on 2019/12/09.
//  Copyright © 2019 Kosuke haraguchi. All rights reserved.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseUI
import OAuthSwift

class TweetsDownloader: ObservableObject {
    @Published var tweets: [Tweet] = [Tweet]()
    var twitterProvider : OAuthProvider?
    
    init () {
        let env = ProcessInfo.processInfo.environment

        let client = OAuthSwiftClient(
            consumerKey: env["CONSUMER_KEY"]!,
            consumerSecret: env["CONSUMER_SECRET"]!,
            oauthToken: env["OAUTH_TOKEN"]!,
            oauthTokenSecret: env["OAUTH_TOKEN_SECRET"]!,
            version: .oauth1
        )
        
        let url = URL(string: "https://api.twitter.com/1.1/favorites/list.json")!
        client.get(url) { result in
            switch result {
                case .success(let response):
                    guard let favoritdTweets = try? JSONDecoder().decode([Tweet].self, from: response.data) else {
                        return
                    }
                    self.tweets = favoritdTweets
                    print(self.tweets)
                case .failure:
                    self.tweets = []
                    print("failure!!!!")
                    break
            }
        }
    }
}
