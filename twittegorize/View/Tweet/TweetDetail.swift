//
//  TweetDetail.swift
//  twittegorize
//
//  Created by 原口公輔 on 2019/11/01.
//  Copyright © 2019 Kosuke haraguchi. All rights reserved.
//

import SwiftUI
import URLImage
import Combine

struct TweetDetail: View {
    var tweet: Tweet
    @EnvironmentObject private var userData: UserData
    
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
            Picker(selection: /*@START_MENU_TOKEN@*/.constant(1)/*@END_MENU_TOKEN@*/, label: Text("選択するカテゴリ")) {
                ForEach(userData.categories) { category in
                    Text(category.title).tag(Int(category.id))
                }
            }
            .onTapGesture {
                print(1)
//                self.userData.tweets[self.userData.tweets.index(where: {$0.categoryId == tweet.id} )] = "1"
//                self.userData.tweets[self.userData.tweets.first(where: {$0.id == tweet.id} )].categoryId = "1"
            }
//            Spacer()
        }
    }
    
}

struct TweetDetail_Previews: PreviewProvider {
    static var previews: some View {
        TweetDetail(tweet: tweetData[0])
    }
}