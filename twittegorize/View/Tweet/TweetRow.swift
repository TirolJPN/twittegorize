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
            URLImage(URL(string: tweet.user.profile_image_url_https)!,
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
                    Text(verbatim: "@" + tweet.user.screen_name)
                }
                Text(verbatim: tweet.text)
            }
        }
    }
}

