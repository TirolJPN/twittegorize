//
//  CategoryList.swift
//  twittegorize
//
//  Created by 原口公輔 on 2019/11/03.
//  Copyright © 2019 Kosuke haraguchi. All rights reserved.
//

import SwiftUI

struct CategoryList: View {
    @EnvironmentObject private var userData: UserData
    
    var body: some View {
        NavigationView {
            List {
                ForEach(userData.categories) { category in
                    NavigationLink (
                        destination: CategoryDetail(tweets:  self.userData.tweets.filter{ $0.categoryId == category.id })
                            .environmentObject(self.userData)
                    ) {
                        CategoryRow(category: category)
                    }
                }
            }
            .navigationBarTitle(Text("Category List"))
        }
    }
}

struct CategoryList_Previews: PreviewProvider {
    static var previews: some View {
        CategoryList()
            .environmentObject(UserData())
    }
}
