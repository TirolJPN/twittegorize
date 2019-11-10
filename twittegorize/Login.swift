//
//  Login.swift
//  twittegorize
//
//  Created by 原口公輔 on 2019/11/08.
//  Copyright © 2019 Kosuke haraguchi. All rights reserved.
//

import SwiftUI

struct Login: View {
    var body: some View {
         NavigationView {
            VStack {
                NavigationLink(destination: Content()) {
                    Text("ログインする")
                }
            }
       }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
