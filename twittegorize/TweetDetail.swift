//
//  TweetDetail.swift
//  twittegorize
//
//  Created by 原口公輔 on 2019/11/01.
//  Copyright © 2019 Kosuke haraguchi. All rights reserved.
//

import SwiftUI
import URLImage

struct TweetDetail: View {
    var tweet: Tweet
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                URLImage(URL(string: tweet.user.profileImageURL)!,
                    delay: 0.25,
                    processors: [ Resize(size: CGSize(width: 50.0, height: 50.0), scale: UIScreen.main.scale) ],
                    content:  {
                        $0.image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                    })
                        .frame(width: 50.0, height: 50.0)
                VStack(alignment: .leading){
                    HStack{
                        Text(verbatim: tweet.user.name)
                            .bold()
                        Text(verbatim: "@" + tweet.user.screenName)
                    }
                    Text(verbatim: tweet.text)
                }
            }
            Spacer()
        }
    }
}

struct TweetDetail_Previews: PreviewProvider {
    static var previews: some View {
        TweetDetail(tweet: tweetData[0])
    }
}
