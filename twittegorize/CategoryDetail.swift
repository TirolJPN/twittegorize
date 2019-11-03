//
//  CategoryDetail.swift
//  twittegorize
//
//  Created by 原口公輔 on 2019/11/03.
//  Copyright © 2019 Kosuke haraguchi. All rights reserved.
//

import SwiftUI

struct CategoryDetail: View {
    var tweets: [Tweet]
    
    var body: some View {
        List {
            ForEach(tweets) { tweet in
                VStack{
                    Text(verbatim: tweet.categoryId)
                    Text(verbatim: tweet.text)
                }
            }
        }
        .navigationBarTitle(Text("hoge"))
    }
}
