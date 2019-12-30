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
import RealmSwift


struct TweetDetail: View {
    var tweet: Tweet
    var realm: Realm!
    @EnvironmentObject private var dummyData: DummyData
    @State private var selectedTweetIndex = 0
    
    

    
    func addDummyCategorisedTweet(tweet: Tweet, category_id: Int) {
        let realm = try! Realm()
        print(tweet)
        // TODO: Realmの追加処理をかく
         try! realm.write {
            realm.add(
                RealmCategorisedTweet(
                    value:
                    [
                        "category_id": category_id,
                        "tweet_created_at": tweet.created_at,
                        "tweet_id": tweet.id,
                        "tweet_id_str": tweet.id_str,
                        "tweet_text": tweet.text,
                        "tweet_source": tweet.source,
                        "tweet_truncated": tweet.truncated,
                    
                        "user_id": tweet.user.id,
                        "user_id_str": tweet.user.id_str,
                        "user_name": tweet.user.name,
                        "user_screen_name": tweet.user.screen_name,
                        "user_location": tweet.user.location,
                        "user_profile_image_url_https": tweet.user.profile_image_url_https
                    ]
                )
            )
        }
        print(1)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
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
            Picker(selection: $selectedTweetIndex, label: Text("選択するカテゴリ")) {
                ForEach(dummyData.categories) { category in
                    Text(category.title).tag(Int(category.id))
                }
            }
            .onTapGesture {
                self.addDummyCategorisedTweet(tweet: self.tweet, category_id: self.selectedTweetIndex)
            }
//            .onTapGesture {
//                self.addDummyCategorisedTweet(tweet: self.tweet, category_id: self.selectedTweetIndex)
//                // TODO: Pickerが更新された時点でaddDummyCategorisedTweet(tweet: Tweet)を呼び出す
//
//            }
        

//            Spacer()
        }
    }
}
