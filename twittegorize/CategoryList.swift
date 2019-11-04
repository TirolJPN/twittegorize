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
                        destination: CategoryDetail(tweets:  self.userData.tweets.filter{ $0.categoryId == category.id }, categoryTitle: category.title)
                            .environmentObject(self.userData)
                    ) {
                        CategoryRow(category: category)
                    }
                }
                .onDelete(perform: deletePlace)
                .onMove(perform: movePlace)
            }
            .navigationBarItems(trailing: EditButton())
            .navigationBarTitle(Text("Category List"))
        }
    }
    
    func deletePlace(at offset: IndexSet){
        if let offset = offset.last {
            self.userData.categories.remove(at: offset)
        }
    }
    
    func movePlace(from source: IndexSet, to destionation: Int) {
        print(source, destionation)
    }
}

struct CategoryList_Previews: PreviewProvider {
    static var previews: some View {
        CategoryList()
            .environmentObject(UserData())
    }
}
