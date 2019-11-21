//
//  Login.swift
//  twittegorize
//
//  Created by 原口公輔 on 2019/11/08.
//  Copyright © 2019 Kosuke haraguchi. All rights reserved.
//

import SwiftUI
import UIKit
import FirebaseAuth
import Firebase
import FirebaseUI


struct Login: View {
    var body: some View {
        LoginButtonControllerWrapper()
    }
}

struct LoginButtonControllerWrapper: UIViewControllerRepresentable {
    typealias UIViewControllerType = LoginButtonController
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<LoginButtonControllerWrapper>) -> LoginButtonController {
        return LoginButtonController()
    }
    
    
    func updateUIViewController(_ uiViewController: LoginButtonControllerWrapper.UIViewControllerType, context: UIViewControllerRepresentableContext<LoginButtonControllerWrapper>) {
    }

}

class LoginButtonController : UIViewController {
    var twitterProvider : OAuthProvider?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.

        self.twitterProvider = OAuthProvider(providerID:"twitter.com");
        
        let AuthButton = UIButton(type: UIButton.ButtonType.system)
        AuthButton.addTarget(self, action: #selector(buttonEvent(_:)), for: UIControl.Event.touchUpInside)
        // ラベルを設定する
        AuthButton.setTitle("ボタンのテキスト", for: UIControl.State.normal)

        // サイズを決める(自動調整)
        AuthButton.sizeToFit()

        // 位置を決める(画面中央)
        AuthButton.center = self.view.center
        self.view.addSubview(AuthButton)
    }
    
    @objc func buttonEvent(_ sender: UIButton) {
        print("ボタンの情報: \(sender)")
        
        self.twitterProvider?.getCredentialWith(_: nil){ (credential, error) in
            print("phase 1")
            if error != nil {
                // Handle error.
            }
            if let credential = credential {
                print("phase 2")
                Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
                    if error != nil {
                        // Handle error.
                    }
                    print("phase 3")
                    // User is signed in.
                    // IdP data available in authResult.additionalUserInfo.profile.
                    // Twitter OAuth access token can also be retrieved by:
                    // authResult.credential.accessToken
                    // Twitter OAuth ID token can be retrieved by calling:
                    // authResult.credential.idToken
                    // Twitter OAuth secret can be retrieved by calling:
                    // authResult.credential.secret
                    
                }
            }
        }
    }
}
