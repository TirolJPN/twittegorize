//
//  ContentView.swift
//  twittegorize
//
//  Created by 原口公輔 on 2019/10/15.
//  Copyright © 2019 Kosuke haraguchi. All rights reserved.
//

import SwiftUI

struct TweetList: View {
    @EnvironmentObject private var userData: UserData
 
    var body: some View {
        NavigationView {
            List {
                ForEach(userData.tweets) { tweet in
                    NavigationLink(
                        destination: TweetDetail(tweet: tweet)
                            .environmentObject(self.userData)
                    ) {
                        TweetRow(tweet: tweet)
                    }
                }
            }
            .navigationBarTitle(Text("Favorited Tweet List"))
        }
    }
}

struct TweetList_Previews: PreviewProvider {
    static var previews: some View {
        TweetList()
        .environmentObject(UserData())
    }
}
