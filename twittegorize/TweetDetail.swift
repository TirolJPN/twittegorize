//
//  TweetDetail.swift
//  twittegorize
//
//  Created by 原口公輔 on 2019/11/01.
//  Copyright © 2019 Kosuke haraguchi. All rights reserved.
//

import SwiftUI

struct TweetDetail: View {
    var tweet: Tweet
    
    var body: some View {
            VStack{
                Text("Choose your category to save")
                Text(tweet.text)
            }
        }
}

struct TweetDetail_Previews: PreviewProvider {
    static var previews: some View {
        TweetDetail(tweet: tweetData[0])
    }
}
