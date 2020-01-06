//
//  CategoryList.swift
//  twittegorize
//
//  Created by 原口公輔 on 2019/11/03.
//  Copyright © 2019 Kosuke haraguchi. All rights reserved.
//

import SwiftUI
import RealmSwift

struct CategoryList: View {
    @ObservedObject var tweets: TweetsDownloader = TweetsDownloader()
    @ObservedObject var categories = BindableResults(results: try! Realm().objects(RealmCategory.self))
    
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    ForEach (categories.results, id: \.id)  { category in
                        NavigationLink (
                            destination: CategoryDetail(tweets: [Tweet](), categoryTitle: category.title)
                        ) {
                            CategoryRow(category: category)
                        }
                    }
//                    .onDelete(perform: deletePlace)
//                    .onMove(perform: movePlace)
                }
                .navigationBarItems(trailing: EditButton())
                .navigationBarTitle(Text("Category List"))
            }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        MyRealmCategory().createDummyRealmCategory()
                    }, label: {
                        Text(verbatim: "+")
                        .font(.system(.largeTitle))
                        .frame(width: 77, height: 70)
                        .foregroundColor(Color.white)
                        .padding(.bottom, 7)
                    })
                    .background(Color.blue)
                    .cornerRadius(38.5)
                    .padding()
                    .shadow(color: Color.black.opacity(0.3),
                            radius: 3,
                            x: 3,
                            y: 3)
                }
            }
        }
    }
    
    func deletePlace(at offset: IndexSet){
//        if let offset = offset.last {
//            self.dummyData.categories.remove(at: offset)
//        }
    }
    
    func movePlace(from source: IndexSet, to destionation: Int) {
//        print(source, destionation)
    }
}

class BindableResults<Element>: ObservableObject where Element: RealmSwift.RealmCollectionValue {

    var results: Results<Element>
    private var token: NotificationToken!

    init(results: Results<Element>) {
        self.results = results
        lateInit()
    }

    func lateInit() {
        token = results.observe { [weak self] _ in
            self?.objectWillChange.send()
        }
    }

    deinit {
        token.invalidate()
    }
}
