//
//  UserData.swift
//  twittegorize
//
//  Created by 原口公輔 on 2019/10/30.
//  Copyright © 2019 Kosuke haraguchi. All rights reserved.
//

import Combine
import SwiftUI

final class UserData: ObservableObject {
    @Published var tweets = tweetData
    @Published var categories = categoryData
}
