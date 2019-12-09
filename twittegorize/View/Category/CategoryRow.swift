//
//  CategoryRow.swift
//  twittegorize
//
//  Created by 原口公輔 on 2019/11/03.
//  Copyright © 2019 Kosuke haraguchi. All rights reserved.
//

import SwiftUI

struct CategoryRow: View {
    var category: Category
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(verbatim: category.title)
                .font(.title)
            Text(verbatim: category.description)
        }
    }
}
