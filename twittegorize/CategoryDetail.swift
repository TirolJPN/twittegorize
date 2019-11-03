//
//  CategoryDetail.swift
//  twittegorize
//
//  Created by 原口公輔 on 2019/11/03.
//  Copyright © 2019 Kosuke haraguchi. All rights reserved.
//

import SwiftUI

struct CategoryDetail: View {
    var category: Category
    
    var body: some View {
        HStack {
            Text(category.title)
            Text(category.description)
        }
    }
}

struct CategoryDetail_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetail(category: categoryData[0])
    }
}
