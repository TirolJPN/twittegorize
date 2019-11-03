//
//  Content.swift
//  twittegorize
//
//  Created by 原口公輔 on 2019/11/01.
//  Copyright © 2019 Kosuke haraguchi. All rights reserved.
//

import SwiftUI

struct Content: View {
    var body: some View {
        TabView {
            TweetList()
                .tabItem {
                    Text("Tweet List")
                }
            CategoryList()
                .tabItem {
                    Text("Category")
                }
        }
    }
}

struct Content_Previews: PreviewProvider {
    static var previews: some View {
        Content()
    }
}
