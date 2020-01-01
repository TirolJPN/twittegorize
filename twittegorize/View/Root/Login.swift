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
import OAuthSwift


struct Login: View {
    let backGroundColor = LinearGradient(gradient: Gradient(colors: [Color.white, Color(red: 0.6, green: 0.6, blue: 1.0)]),
                                         startPoint: .top, endPoint: .bottom)
    var body: some View {
        ZStack {
            backGroundColor.edgesIgnoringSafeArea(.all)
            LoginButtonControllerWrapper()
        }
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
        AuthButton.setTitle("Sign in with Twitter", for: UIControl.State.normal)
        AuthButton.backgroundColor = UIColor(red: 0.0, green: (172/255), blue: (237/255), alpha: 1)
        AuthButton.frame = CGRect(x: 10, y: 10, width: 300, height: 50)
        AuthButton.center = self.view.center
        AuthButton.setTitleColor(UIColor.white, for: .normal)
        AuthButton.setTitleShadowColor(UIColor.black, for: UIControl.State.normal)
        AuthButton.titleLabel?.adjustsFontSizeToFitWidth = true
        
        self.view.addSubview(AuthButton)
    }
    
    @objc func buttonEvent(_ sender: UIButton) {
//        print("info about button : \(sender)")
        self.twitterProvider?.getCredentialWith(_: nil){ (credential, error) in
//            print("start to sign in")
            if error != nil {
                // Handle error.
            }
            if let credential = credential {
                Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
                    if error != nil {
                        // Handle error.
                        print("fail to sign in")
                    }
                    
                    let env = ProcessInfo.processInfo.environment

                    let client = OAuthSwiftClient(
                        consumerKey: env["CONSUMER_KEY"]!,
                        consumerSecret: env["CONSUMER_SECRET"]!,
                        oauthToken: env["OAUTH_TOKEN"]!,
                        oauthTokenSecret: env["OAUTH_TOKEN_SECRET"]!,
                        version: .oauth1
                    )
                    
                    let url = URL(string: "https://api.twitter.com/1.1/favorites/list.json")!
                    client.get(url) { result in
                        switch result {
                            case .success(let response):
                                guard let favorites = try? JSONDecoder().decode([Tweet].self, from: response.data) else {
                                    return
                                }
                            case .failure:
                                break
                        }
                    }
                    
                    let vc = UIHostingController(rootView: Content().environmentObject(DummyData()))
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true)
                }
            }
        }
    }
}
