//
//  TimelineViewController.swift
//  twittegorize
//
//  Created by 原口公輔 on 2019/10/22.
//  Copyright © 2019 Kosuke haraguchi. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    // テーブル表示用のデータソース
    var tweets: [Tweet] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ダミーデータの作成
        let user = User(id: "1", screenName: "ktanaka117", name: "ダンボー田中", profileImageURL: "https://pbs.twimg.com/profile_images/1122848644225355777/3T_eJG72_400x400.jpg")
        let tweet = Tweet(id: "01", text: "Twitterクライアント作成なう", user: user)
        
        let tweets = [tweet]
        self.tweets = tweets

        // tableViewのリロード
        tableView.reloadData()
        
        // Do any additional setup after loading the view.
        // tableView.delegate = self
        // tableView.dataSource = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}

extension TimelineViewController: UITableViewDelegate {
    // cellがタップされたのを察知した時に実行する処理
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print("セルがタップされました")
    }
    
    // セルの見積もりの高さを指定する処理
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    // セルの高さ指定をする処理
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // UITableViewCellの高さを自動で取得する値
        // origin: return UITableViewAutomaticDimension
        return UITableView.automaticDimension
    }
}


// --- UITableViewDelegateを省略 ---
extension TimelineViewController: UITableViewDataSource {
    // 何個のcellを生成するか設定する関数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // tweetsの配列内の要素数を取得
        return tweets.count
    }
    
    // 描画するcellを設定する関数
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TweetTableViewCellを表示したいので、TweetTableViewCellを取得
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetTableViewCell") as! TweetTableViewCell
        
        return cell
    }
}
