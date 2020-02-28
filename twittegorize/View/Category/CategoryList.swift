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

typealias Model = Object & Identifiable

struct ListKey<T: Model>: Identifiable {
    let id: T.ID
}

extension Results where Element: Model {
    
    subscript(key: ListKey<Element>) -> Element? {
        Element.primaryKey().flatMap { self.filter("\($0) = %@", key.id).first }
    }
    
    var keyedEnumeration: [ListKey<Element>] {
        guard let key = Element.primaryKey() else { return [] }
        let keys = value(forKey: key) as! [Element.ID]
        return keys.enumerated().map { ListKey(id: $0.1) }
    }
}

struct CategoryList: View {
    @ObservedObject var tweets: TweetsDownloader = TweetsDownloader()
//    @ObservedObject var categories = BindableResults(results: try! Realm().objects(RealmCategory.self))
    @ObservedObject var categories = CategoryViewModel()
    
    
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    ForEach (categories.RealmCategories.keyedEnumeration) { key in
                        let category = categories.RealmCategories[key.index]
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
        let categoriesArray = Array(categories.RealmCategories)
        let index = offset.first!
        
        let realm = try! Realm()
        let results = realm.objects(RealmCategory.self).filter("id = '\(categoriesArray[index].id)'" )
        try! realm.write {
            realm.delete(results)
        }
        
    }
}


class CategoryViewModel: ObservableObject {
    @Published var RealmCategories: Results<RealmCategory> = RealmCategory.all()
    private var notificationTokens: [NotificationToken] = []
    
    init() {
        notificationTokens.append(RealmCategories.observe { change in
            switch change {
            case let .initial(results):
                self.RealmCategories = results
            case let .update(results, _, _, _):
                self.RealmCategories = results
            case let .error(error):
                print(error.localizedDescription)
            }
        })
    }
    
//    static func hoge () -> [ListKey<RealmCategory>]  {
//        return RealmCategories.keyedEnumeration
//    }
    
    deinit {
        notificationTokens.forEach { $0.invalidate() }
    }
}



//class BindableResults<Element>: ObservableObject where Element: RealmSwift.RealmCollectionValue {
//
//    var results: Results<Element>
//    private var token: NotificationToken!
//
//    init(results: Results<Element>) {
//        self.results = results
//        lateInit()
//    }
//
//    func lateInit() {
//        token = results.observe { [weak self] _ in
//            self?.objectWillChange.send()
//        }
//    }
//
//    deinit {
//        token.invalidate()
//    }
//}
