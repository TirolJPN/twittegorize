//
//  TweetDetail.swift
//  twittegorize
//
//  Created by 原口公輔 on 2019/10/30.
//  Copyright © 2019 Kosuke haraguchi. All rights reserved.
//

import SwiftUI
import URLImage

struct TweetRow: View {
    var tweet: Tweet
    
    var body: some View {
        HStack {
//            URLImage(URL(string: tweet.user.profileImageURL))
//            Text(verbatim: tweet.text)
//            Spacer()
            
            URLImage(URL(string: tweet.user.profileImageURL)!,
                delay: 0.25,
                processors: [ Resize(size: CGSize(width: 100.0, height: 100.0), scale: UIScreen.main.scale) ],
                content:  {
                    $0.image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                })
                    .frame(width: 100.0, height: 100.0)

            Text(verbatim: tweet.text)
        }
    }
}

struct TweetRow_Previews: PreviewProvider {
    static var previews: some View {
        TweetRow(tweet: tweetData[0])
    }
}
