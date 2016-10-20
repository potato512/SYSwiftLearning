//
//  WebViewVC.swift
//  DemoSwift118_webview
//
//  Created by zhangshaoyu on 16/9/30.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

import UIKit

class WebViewVC: UIViewController, UIWebViewDelegate {

    let url:NSURL! = NSURL(string: "http://www.hao123.com")
    var webview:UIWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "webView的使用"
        
        let item01 = UIBarButtonItem(title: "stop", style: UIBarButtonItemStyle.Done, target: self, action: Selector("buttonClick:"))
        item01.tag = 1000
        let item02 = UIBarButtonItem(title: "start", style: UIBarButtonItemStyle.Done, target: self, action: Selector("buttonClick:"))
        item02.tag = 2000
        self.navigationItem.rightBarButtonItems = [item01, item02]
        
        // 多按钮视图控件（控制webview的后退，前进，或重新加载属性）
        let segment = UISegmentedControl(items: ["GoBack","GoForward","Reload"])
        self.view.addSubview(segment)
        segment.momentary = true
        segment.frame = CGRectMake(0.0, 0.0, CGRectGetWidth(self.view.bounds), 40.0)
        segment.addTarget(self, action: Selector("segmentValueChange:"), forControlEvents: UIControlEvents.ValueChanged)
      
        // 实例化
        self.webview = UIWebView(frame: CGRectMake(0.0, CGRectGetHeight(segment.frame), CGRectGetWidth(self.view.bounds), (CGRectGetHeight(self.view.bounds) - CGRectGetHeight(segment.bounds))))
        self.view.addSubview(self.webview!)
        
        self.webview!.backgroundColor = UIColor.clearColor()
        
        // 使用"|"无效，应改成[xx,xx,..]
//        self.webview!.autoresizingMask = UIViewAutoresizing.FlexibleTopMargin | UIViewAutoresizing.FlexibleBottomMargin
        self.webview!.autoresizingMask = [UIViewAutoresizing.FlexibleHeight, UIViewAutoresizing.FlexibleBottomMargin]
        self.webview!.scrollView.scrollEnabled = true
        
        // 设置代理对象（注意添加协议及实现代理方法）
        self.webview!.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
    
    deinit
    {
        self.webview?.delegate = nil
        self.webview?.loadHTMLString("", baseURL: nil)
        self.webview?.stopLoading()
        self.webview?.removeFromSuperview()
        self.webview = nil
        
        NSURLCache.sharedURLCache().removeAllCachedResponses()
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
    
    // MARK: - 响应事件
    func buttonClick(sender:UIBarButtonItem)
    {
        let index = sender.tag
        if 1000 == index
        {
            // 停止
            if (self.webview != nil)
            {
                if (self.webview!.loading)
                {
                    self.webview!.stopLoading()
                    
                    UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                }
            }
        }
        else if 2000 == index
        {
            // 开始
            if (self.webview != nil)
            {
                if (!self.webview!.loading)
                {
                    let request = NSURLRequest(URL: self.url)
                    self.webview!.loadRequest(request)
                    
                    UIApplication.sharedApplication().networkActivityIndicatorVisible = true
                }
            }
        }
    }
    
    // MARK: - segmentValueChange
    func segmentValueChange(sender:UISegmentedControl)
    {
        let index = sender.selectedSegmentIndex;
        switch (index)
        {
            case 0:
                let isGoBack = self.webview!.canGoBack
                if isGoBack
                {
                    self.webview?.goBack()
                }

            case 1:
                
                let isGoForward = self.webview!.canGoForward
                if isGoForward
                {
                    self.webview?.goForward()
                }

            case 2:
                let isReload = self.webview!.loading
                if !isReload
                {
                    self.webview?.reload()
                    
                    UIApplication.sharedApplication().networkActivityIndicatorVisible = true
                }
            default : print("无效操作")
        }
    }
    
    // MARK: - UIWebViewDelegate
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        print("\(request),\(navigationType)")
        
        // 用于控制子链接是否可以打开跳转
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        return true
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        
        // 加载开始
        print("1 webViewDidStartLoad")
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        // 加载结束（加载成功）
        print("2 webViewDidFinishLoad")
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        // 加载结束（加载失败）
        print("3 webView error = \(error)")
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
}
