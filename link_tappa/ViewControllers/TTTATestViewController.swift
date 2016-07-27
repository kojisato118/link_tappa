//
//  TTTATestViewController.swift
//  link_tappa
//
//  Created by 佐藤 康次 on 2016/07/27.
//  Copyright © 2016年 toosaa. All rights reserved.
//

import UIKit
import TTTAttributedLabel

// 参考: http://qiita.com/fuhi1983/items/5500ad8428088d5e9d2c

class TTTATestViewController: UIViewController, TTTAttributedLabelDelegate {
    @IBOutlet weak var tttaLabel: TTTAttributedLabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        let text = "リンクをそのまま(http://qiita.com/fuhi1983/items/5500ad8428088d5e9d2c)\naタグだとこうなる。<a href=\"http://www.google.com\">google</a><br>"
        
        tttaLabel.delegate = self
        tttaLabel.numberOfLines = 0
        
        // セットした文字列からURLを見つけてくれるように設定
        tttaLabel.enabledTextCheckingTypes = NSTextCheckingType.Link.rawValue
        
        // 表示する文字列をセット
        let t = try! NSAttributedString(
            data: text.dataUsingEncoding(NSUnicodeStringEncoding, allowLossyConversion: true)!,
            options: [NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType],
            documentAttributes: nil)

        tttaLabel.setText(t)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK - TTTAttributedLabelDelegate
    func attributedLabel(label: TTTAttributedLabel!, didSelectLinkWithURL url: NSURL!) {
        // Safariで開く
        if UIApplication.sharedApplication().canOpenURL(url){
            UIApplication.sharedApplication().openURL(url)
        }
    }
}
