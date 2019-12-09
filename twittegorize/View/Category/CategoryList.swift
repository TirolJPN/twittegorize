//
//  CategoryList.swift
//  twittegorize
//
//  Created by 原口公輔 on 2019/11/03.
//  Copyright © 2019 Kosuke haraguchi. All rights reserved.
//

import SwiftUI

struct CategoryList: View {
    @EnvironmentObject private var dummyData: DummyData
    @ObservedObject var tweets: TweetsDownloader = TweetsDownloader()
    
    var body: some View {
        ZStack {  
            Text("Categrories")
//            NavigationView {
//                List {
//                    ForEach(dummyData.categories) { category in
//                        NavigationLink (
//                            destination: CategoryDetail(tweets:  self.tweets.filter{ $0.categoryId == category.id }, categoryTitle: category.title)
//                                .environmentObject(self.userData)
//                        ) {
//                            CategoryRow(category: category)
//                        }
//                    }
//                    .onDelete(perform: deletePlace)
//                    .onMove(perform: movePlace)
//                }
//                .navigationBarItems(trailing: EditButton())
//                .navigationBarTitle(Text("Category List"))
//            }
            
//            VStack {
//                Spacer()
//                HStack {
//                    Spacer()
//                    Button(action: {
//                        self.dummyData.categories.append(
//                            Category(id: String(self.dummyData.categories.count + 1), title: "追加したカテゴリー", description: "追加したカテゴリー")
//                        )
//                    }, label: {
//                        Text("+")
//                        .font(.system(.largeTitle))
//                        .frame(width: 77, height: 70)
//                        .foregroundColor(Color.white)
//                        .padding(.bottom, 7)
//                    })
//                    .background(Color.blue)
//                    .cornerRadius(38.5)
//                    .padding()
//                    .shadow(color: Color.black.opacity(0.3),
//                            radius: 3,
//                            x: 3,
//                            y: 3)
//                }
//            }
        }
    }
    
    func deletePlace(at offset: IndexSet){
        if let offset = offset.last {
            self.dummyData.categories.remove(at: offset)
        }
    }
    
    func movePlace(from source: IndexSet, to destionation: Int) {
        print(source, destionation)
    }
}
