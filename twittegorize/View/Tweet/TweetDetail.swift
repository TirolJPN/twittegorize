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
    @State private var picked: Int = 0 {didSet{print("here")}}
    
    func addDummyCategorisedTweet(tweet: Tweet, picked_index: Int) {
        let realm = try! Realm()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        print(dummyCategories[picked_index])
        // TODO: Realmの追加処理をかく
         try! realm.write {
            realm.add(
                RealmCategorisedTweet(
                    value:
                    [
                        "category_id": picked_index,
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
            Picker(selection: $picked, label: Text("選択するカテゴリ")) {
//                ForEach(dummyData.categories) { category in
//                    Text(category.title).tag(Int(category.id))
//                }
                ForEach(0...(dummyCategories.count - 1), id: \.self) { index in
                    Text(dummyCategories[index].title).tag(dummyCategories[index].id)
                }
            }
            .onTapGesture {
                self.addDummyCategorisedTweet(tweet: self.tweet, picked_index: self.picked)
            }
            Text("you picked: \(dummyCategories[picked].title)")
        }
    }
}
