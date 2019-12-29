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

/*
 class RealmCategorisedTweet: Object {
     @objc dynamic var id: Int64 = -1
     
     @objc dynamic var category_id: Int64 = -1
     
     @objc dynamic var tweet_created_at: String = ""
     @objc dynamic var tweet_id: Int64 = -1
     @objc dynamic var tweet_id_str: String = ""
     @objc dynamic var tweet_text: String = ""
     @objc dynamic var tweet_source: String = ""
     @objc dynamic var tweet_truncated: Bool = false
     @objc dynamic var tweet_retweet_count: Int = -1
     @objc dynamic var tweet_favorite_count: Int = -1
     @objc dynamic var tweet_favorited: Bool = false
     @objc dynamic var tweet_retweeted: Bool = false
     
 //    @objc dynamic var user: User
     @objc dynamic var  user_id: Int64 = -1
     @objc dynamic var  user_id_str: String = ""
     @objc dynamic var  user_name: String = ""
     @objc dynamic var  user_screen_name: String = ""
     @objc dynamic var  user_location: String = ""
     @objc dynamic var  user_profile_image_url_https: String = ""
     
     // A setting for primary key
     override static func primaryKey() -> String {
         return "id"
     }
 }

 */

struct TweetDetail: View {
    var tweet: Tweet
    var realm: Realm!
    @EnvironmentObject private var dummyData: DummyData
    
    func addDummyCategorisedTweet(tweet: Tweet, category_id: Int64) {
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
                        "tweet_retweet_count": tweet.retweet_count,
                        "tweet_favorited_count": tweet.favorite_count,
                        "tweet_favorited": tweet.favorited,
                        "tweet_retweeted": tweet.retweeted,
                        
                        "user_id": tweet.user.id,
                        "user_id_str": tweet.user.id,
                        "user_name": tweet.user.name,
                        "user_screen_name": tweet.user.screen_name,
                        "user_location": tweet.user.location,
                        "user_profile_image_url_https": tweet.user.profile_image_url_https
                    ]
                )
            )
        }
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
            Picker(selection: /*@START_MENU_TOKEN@*/.constant(1)/*@END_MENU_TOKEN@*/, label: Text("選択するカテゴリ")) {
                ForEach(dummyData.categories) { category in
                    Text(category.title).tag(Int(category.id))
                }
            }
            .onTapGesture {
                print(1)
                // TODO: Pickerが更新された時点でaddDummyCategorisedTweet(tweet: Tweet)を呼び出す
                
//                self.userData.tweets[self.userData.tweets.index(where: {$0.categoryId == tweet.id} )] = "1"
//                self.userData.tweets[self.userData.tweets.first(where: {$0.id == tweet.id} )].categoryId = "1"
            }
        

//            Spacer()
        }
    }
}
