//
//  TweetDetail.swift
//  twittegorize
//
//  Created by 原口公輔 on 2019/10/30.
//  Copyright © 2019 Kosuke haraguchi. All rights reserved.
//

import SwiftUI

struct TweetRow: View {
    var tweet: Tweet
    
    var body: some View {
        HStack {
//            tweet.image
//                .resizable()
//                .frame(width: 50, height: 50)
            Text(verbatim: tweet.text)
            Spacer()

        }
    }
}

struct TweetRow_Previews: PreviewProvider {
    static var previews: some View {
        TweetRow(tweet: tweetData[0])
    }
}
