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
        // No user is signed in.
        LoginButtonControllerWrapper()
    }
}

struct LoginButtonControllerWrapper: UIViewControllerRepresentable {
    typealias UIViewControllerType = LoginButtonController
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<LoginButtonControllerWrapper>) -> LoginButtonController {
        return LoginButtonController()
    }
    
    
    func updateUIViewController(_ uiViewController: LoginButtonControllerWrapper.UIViewControllerType, context: UIViewControllerRepresentableContext<LoginButtonControllerWrapper>) {
        //
    }

}
/*
class LoginButtonController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("hoge1")
        let logInButton = TWTRLogInButton(logInCompletion:
        { session, error in
            if let session = session {
                print("hoge2")
                let authToken = session.authToken
                let authTokenSecret = session.authTokenSecret
                let credential = TwitterAuthProvider.credential(withToken: session.authToken, secret: session.authTokenSecret)

                Auth.auth().signIn(with: credential) { (authResult, error) in
                    if let error = error { return }
                    //Sign In Completed
                    print("hoge3")
                }
            }
        })
        logInButton.center = self.view.center
        self.view.addSubview(logInButton)
    }
}
 */

class LoginButtonController : UIViewController, FUIAuthDelegate {
    let authUI: FUIAuth = FUIAuth.defaultAuthUI()!
    // 認証に使用するプロバイダの選択
    lazy var providers: [FUIAuthProvider] = [
        twitterAuthProvider()!,
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // authUIのデリゲート
        var AuthButton = UIButton()
        self.authUI.delegate = self
        self.authUI.providers = providers
        AuthButton.center = self.view.center
        self.view.addSubview(AuthButton)
    }
    
    func twitterAuthProvider() -> FUIAuthProvider? {
        let buttonColor = UIColor(red: 71.0/255.0, green: 154.0/255.0, blue: 234.0/255.0, alpha: 1.0)
        return FUIOAuth(authUI: self.authUI,
                      providerID: "twitter.com",
                      buttonLabelText: "Sign in with Twitter",
                      shortName: "Twitter",
                      buttonColor: buttonColor,
                      scopes: ["user.readwrite"],
                      customParameters: ["prompt" : "consent"],
                      loginHintKey: nil)
    }

    //　認証画面から離れたときに呼ばれる（キャンセルボタン押下含む）
    public func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?){
        // 認証に成功した場合
        if error == nil {
            self.performSegue(withIdentifier: "toTopView", sender: self)
            }
        // エラー時の処理をここに書く
    }
    //    @objc func AuthButtonTapped(sender : AnyObject) {
    //        // FirebaseUIのViewの取得
    //        let authViewController = self.authUI.authViewController()
    //        // FirebaseUIのViewの表示
    ////        self.present(authViewController, animated: true, completion: nil)
    //    }
}

/*
struct hoge: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        /*
        print("hoge1")
        let view: UIView = UIView()
        let logInButton = TWTRLogInButton(logInCompletion: { session, error in
            if let session = session {
                print("hoge2")
                let authToken = session.authToken
                let authTokenSecret = session.authTokenSecret
                let credential = TwitterAuthProvider.credential(withToken: session.authToken, secret: session.authTokenSecret)
                print("hoge3")
                Auth.auth().signIn(with: credential) { (authResult, error) in
                    if let error = error { return }
                    //Sign In Completed

                }
            }
        })
        view.addSubview(logInButton)
        return view
        */
        
        // すでにログイン済みか
        
        let view: UIView = UIView()
        if !hasAlreadyTwitterAuth() {
            print("login phase")
            let logInButton = TWTRLogInButton { (session, error) in
               if let unwrappedSession = session {
                   let alert = UIAlertController(title: "Logged In",
                                                 message: "User \(unwrappedSession.userName) has logged in",
                       preferredStyle: UIAlertController.Style.alert
                   )
                   alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                   
               } else {
                   NSLog("Login error: %@", error!.localizedDescription);
               }
            }
            view.addSubview(logInButton)

        } else {
           // 既にログインしていればtimelineへ
           print("already logined")
        }
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        //
    }
    
    func hasAlreadyTwitterAuth() -> Bool {
        if TWTRTwitter.sharedInstance().sessionStore.hasLoggedInUsers() {
            return true
        }
        return false
    }
}
*/
