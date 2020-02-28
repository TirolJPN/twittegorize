//
//  CategoryList.swift
//  twittegorize
//
//  Created by 原口公輔 on 2019/11/03.
//  Copyright © 2019 Kosuke haraguchi. All rights reserved.
//

import SwiftUI
import RealmSwift
import Combine

struct CategoryList: View {
    @ObservedObject var tweets: TweetsDownloader = TweetsDownloader()
    @ObservedObject var categories = BindableResults(results: try! Realm().objects(RealmCategory.self))
    
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    ForEach (categories.results, id: \.self)  { category in
                        NavigationLink (
                            destination: CategoryDetail(tweets: [Tweet](), categoryTitle: category.title)
                        ) {
                            CategoryRow(category: category)
                        }
                    }
                    .onDelete(perform: delete(at:))
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
    
    // 該当するカテゴリーを削除する
    func delete(at offset: IndexSet){
        let categoriesArray = Array(categories.results)
        let index = offset.first!
        
        let realm = try! Realm()
        let results = realm.objects(RealmCategory.self).filter("id == '\(categoriesArray[index].id)'" )
        try! realm.write {
            realm.delete(results)
        }
        
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

class CategoryViewModel: ObservableObject {
    var objectWillChange: ObservableObjectPublisher = .init()
    private(set) var RealmCategories: Results<RealmCategory> = RealmCategory.all()
    private var notificationTokens: [NotificationToken] = []
    
    init() {
        notificationTokens.append(RealmCategories.observe { _ in
            // SwiftUIに再レンダリングが必要なことを伝える
            self.objectWillChange.send()
        })
    }
    
}
