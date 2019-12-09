//
//  ContentView.swift
//  twittegorize
//
//  Created by 原口公輔 on 2019/10/15.
//  Copyright © 2019 Kosuke haraguchi. All rights reserved.
//

import SwiftUI

struct TweetList: View {
    @EnvironmentObject private var dummyData: DummyData
    @ObservedObject var tweets: TweetsDownloader = TweetsDownloader()
 
    var body: some View {
        NavigationView {
            List {
                ForEach(self.tweets.tweets) { tweet in
                    NavigationLink(
                        destination: TweetDetail(tweet: tweet)
                            .environmentObject(self.dummyData)
                    ) {
                        TweetRow(tweet: tweet)
                            .environmentObject(self.dummyData)
                    }
                }
            }
            .navigationBarTitle(Text("Favorited Tweet List"))
        }
    }
}
