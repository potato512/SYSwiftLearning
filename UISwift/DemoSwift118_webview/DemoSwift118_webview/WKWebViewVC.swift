//
//  WKWebViewVC.swift
//  DemoSwift118_webview
//
//  Created by zhangshaoyu on 16/9/30.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

import UIKit

// swift中使用WKWebView注意添加"WebKit"框架
import WebKit

class WKWebViewVC: UIViewController, UIWebViewDelegate, WKNavigationDelegate {

    let url:NSURL! = NSURL(string: "http://www.hao123.com")
    var webview:WKWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "WHWebView的使用"
        
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
        self.webview = WKWebView(frame: CGRectMake(0.0, CGRectGetHeight(segment.frame), CGRectGetWidth(self.view.bounds), (CGRectGetHeight(self.view.bounds) - CGRectGetHeight(segment.bounds))))
        self.view.addSubview(self.webview!)
        
        self.webview!.backgroundColor = UIColor.clearColor()
        
        // 使用"|"无效，应改成[xx,xx,..]
        //        self.webview!.autoresizingMask = UIViewAutoresizing.FlexibleTopMargin | UIViewAutoresizing.FlexibleBottomMargin
        self.webview!.autoresizingMask = [UIViewAutoresizing.FlexibleHeight, UIViewAutoresizing.FlexibleBottomMargin]
        self.webview!.scrollView.scrollEnabled = true
        
        // 设置代理对象（注意添加协议及实现代理方法）
//        self.webview!.UIDelegate = self
        self.webview!.navigationDelegate = self

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
        self.webview?.delete(nil)
        self.webview?.navigationDelegate = nil
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

    
    
    // MARK: - WKUIDelegate
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
        
        let progress = self.webview!.estimatedProgress
        print("加载进度：\(progress)")
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        // 加载结束（成功）
        print("2 webViewDidStartLoad")
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        // 加载结束（失败）
        print("3 webViewDidStartLoad")
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
    
    
    // MARK: - WKNavigationDelegate
    
    // 在发送请求之前，决定是否跳转的代理（注：不加上decisionHandler回调会造成闪退）
    func webView(webView: WKWebView, decidePolicyForNavigationAction navigationAction: WKNavigationAction, decisionHandler: (WKNavigationActionPolicy) -> Void) {
        print("1 \(webView), \(navigationAction), \(decisionHandler)")
        
        let actionPolicy = WKNavigationActionPolicy.Allow
        decisionHandler(actionPolicy)
    }
    
    // 在收到响应后，决定是否跳转的代理（注：不加上decisionHandler回调会造成闪退）
    func webView(webView: WKWebView, decidePolicyForNavigationResponse navigationResponse: WKNavigationResponse, decisionHandler: (WKNavigationResponsePolicy) -> Void) {
        print("2 \(webView), \(navigationResponse), \(decisionHandler)")
        
        let responsePolicy = WKNavigationResponsePolicy.Allow
        decisionHandler(responsePolicy)
    }
    
    // 页面开始加载
    func webView(webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("3 \(webView), \(navigation)")
    }
    
    // 接收到服务器跳转请求之后调用 (服务器端redirect)，不一定调用
    func webView(webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        print("4 \(webView), \(navigation)")
    }
    
    // 页面加载失败时调用
    func webView(webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: NSError) {
        print("5 \(webView), \(navigation), error = \(error)")
    }
    
    // 开始获取到网页内容时返回
    func webView(webView: WKWebView, didCommitNavigation navigation: WKNavigation!) {
        print("6 \(webView), \(navigation)")
    }
    
    // 页面加载完成之后调用
    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        print("7 \(webView), \(navigation)")
    }
    
    func webView(webView: WKWebView, didFailNavigation navigation: WKNavigation!, withError error: NSError) {
        print("8 \(webView), \(navigation), error = \(error)")
    }
    
    // 接收到服务器跳转请求的代理
    func webView(webView: WKWebView, didReceiveAuthenticationChallenge challenge: NSURLAuthenticationChallenge, completionHandler: (NSURLSessionAuthChallengeDisposition, NSURLCredential?) -> Void) {
        print("9 \(webView), \(challenge), \(completionHandler)")
    }
    
    func webViewWebContentProcessDidTerminate(webView: WKWebView) {
        print("10 \(webView)")
    }
    
    
    // MARK: - 通知方法
    
    func observeProgress()
    {
        // 进度条监视
        let progress = self.webview!.estimatedProgress;
        print("加载进度：%.2f", progress);
        
        self.webview?.addObserver(self, forKeyPath: "estimatedProgress", options: NSKeyValueObservingOptions.New, context: nil)
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        // 进度条
        if (keyPath == "estimatedProgress")
        {
            let progress = self.webview!.estimatedProgress;
            print("正在加载中，加载进度：%.2f", progress);
            
            // 初始和终止状态
            if (progress == 0.0)
            {
                print("加载开始，进度条值：0.0");
            }
            else if (progress == 1.0)
            {
            print("加载结束，进度条值：1.0");
            
                // 1秒后隐藏
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(1.0 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) {
                    // 再次判断，防止正在加载时有其他操作
                    if (progress == 1.0)
                    {
                        print("加载结束，进度条值：1.0（异步）");
                    }
                }
            }
        }
    }
}
