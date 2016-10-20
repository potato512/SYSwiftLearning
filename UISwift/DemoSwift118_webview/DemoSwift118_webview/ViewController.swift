//
//  ViewController.swift
//  DemoSwift118_webview
//
//  Created by zhangshaoyu on 16/9/30.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.title = "webView/WHWebView"
        
        let item01 = UIBarButtonItem(title: "web", style: UIBarButtonItemStyle.Done, target: self, action: Selector("webViewClick:"))
        let item02 = UIBarButtonItem(title: "WKWeb", style: UIBarButtonItemStyle.Done, target: self, action: Selector("WKWebClick:"))
        self.navigationItem.rightBarButtonItems = [item01, item02]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func loadView()
    {
        super.loadView()
        self.view.backgroundColor = UIColor.whiteColor()
        
        // UI适配
        if self.respondsToSelector(Selector("edgesForExtendedLayout"))
        {
            self.edgesForExtendedLayout = UIRectEdge.None
        }
    }
    
    // MARK: - 响应事件
    func webViewClick(sender:UIBarButtonItem)
    {
        let vc = WebViewVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func WKWebClick(sender:UIBarButtonItem)
    {
        let vc = WKWebViewVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

