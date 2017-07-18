//
//  SessionDataTaskVC.swift
//  DemoSwift501_network
//
//  Created by zhangshaoyu on 2017/7/17.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

import UIKit

class SessionDataTaskVC: UIViewController, UITableViewDelegate, UITableViewDataSource, NSURLSessionDelegate {
    
    var array:NSArray!
    var data:NSMutableData!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        self.title = "NSURLSessionDataTask"

        self.array = ["get无参数", "get有参数", "post无参数", "post有参数", "delegate有参数"]
        
        
        let table = UITableView(frame: self.view.bounds, style: .Plain)
        self.view.addSubview(table)
        table.tableFooterView = UIView()
        table.registerClass(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        table.delegate = self
        table.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.array.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell")
        
        let text:String = self.array[indexPath.row] as! String
        cell!.textLabel!.text = text
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let text:String = self.array[indexPath.row] as! String
        if text == "get无参数"
        {
            self.requestWithGet()
        }
        else if text == "get有参数"
        {
            self.requestWithGetParams()
        }
        else if text == "post无参数"
        {
            self.requestWithPost()
        }
        else if text == "post有参数"
        {
            self.requestWithPostParams()
        }
        else if text == "delegate有参数"
        {
            self.requestWithDelegate()
        }
    }
    
    // MARK: - get
    
    func requestWithGet()
    {
        // NSURL
        let url:NSURL = NSURL(string:"http://rapapi.org/mockjsdata/22598/userloginGet")!
        // NSURLRequest
        let request:NSURLRequest = NSURLRequest(URL:url)
        // NSURLSession
        let configuration:NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session:NSURLSession = NSURLSession(configuration: configuration)
        
        // NSURLSessionTask
        let task:NSURLSessionDataTask = session.dataTaskWithRequest(request, completionHandler: {
            (data:NSData?,response:NSURLResponse?, error:NSError?) -> Void in
            if error == nil
            {
                do {
                    let result:NSDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! NSDictionary
                    print(result)
                    
                    dispatch_async(dispatch_get_main_queue(), {
                        () -> Void in
                        let message:String = result.objectForKey("msg") as! String
                        let alert = UIAlertView(title: nil, message: message, delegate: nil, cancelButtonTitle: "OK")
                        alert.show()
                    })
                    
                } catch {
                    
                }
            }
        })
        // 启动任务
        task.resume()
    }
    
    func requestWithGetParams()
    {
        // NSURL
        let url:NSURL = NSURL(string:"http://rapapi.org/mockjsdata/22598/userloginGetWithParams?userName='devZhang'&userPassword='devZhang'")!
        // NSURLRequest
        let request:NSMutableURLRequest = NSMutableURLRequest(URL:url)
        request.HTTPMethod = "GET"
        // 请求的Header
        request.addValue("a566eb03378211f7dc9ff15ca78c2d93", forHTTPHeaderField: "apikey")
        // NSURLSession
        let configuration:NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session:NSURLSession = NSURLSession(configuration: configuration)
        
        // NSURLSessionTask
        let task:NSURLSessionDataTask = session.dataTaskWithRequest(request, completionHandler: {
            (data:NSData?,response:NSURLResponse?, error:NSError?) -> Void in
            if error == nil
            {
                do {
                    let result:NSDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! NSDictionary
                    print(result)
                    
                    dispatch_async(dispatch_get_main_queue(), {
                        () -> Void in
                        let message:String = result.objectForKey("msg") as! String
                        let alert = UIAlertView(title: nil, message: message, delegate: nil, cancelButtonTitle: "OK")
                        alert.show()
                    })
                    
                } catch {
                    
                }
            }
        })
        // 启动任务
        task.resume()
    }
    
    // MARK: - post
    
    func requestWithPost()
    {
        // NSURL
        let url:NSURL = NSURL(string:"http://rapapi.org/mockjsdata/22598/userloginPost")!
        // NSURLRequest
        let request:NSMutableURLRequest = NSMutableURLRequest(URL:url)
        request.HTTPMethod = "POST"
        let postString = ""
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        // NSURLSession
        let configuration:NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session:NSURLSession = NSURLSession(configuration: configuration)
        
        // NSURLSessionTask
        let task:NSURLSessionDataTask = session.dataTaskWithRequest(request, completionHandler: {
            (data:NSData?,response:NSURLResponse?, error:NSError?) -> Void in
            if error == nil
            {
                do {
                    let result:NSDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! NSDictionary
                    print(result)
                    
                    dispatch_async(dispatch_get_main_queue(), {
                        () -> Void in
                        let message:String = result.objectForKey("msg") as! String
                        let alert = UIAlertView(title: nil, message: message, delegate: nil, cancelButtonTitle: "OK")
                        alert.show()
                    })
                    
                } catch {
                    
                }
            }
        })
        // 启动任务
        task.resume()
    }
    
    func requestWithPostParams()
    {
        // NSURL
        let url:NSURL = NSURL(string:"http://rapapi.org/mockjsdata/22598/userloginPostWithParams")!
        // NSURLRequest
        let request:NSMutableURLRequest = NSMutableURLRequest(URL:url)
        request.HTTPMethod = "POST"
        // 参数
        // 方法1
//        let postString = "userName=devZhang&userPassword=devZhang"
//        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        // 方法2
        let postDic :NSDictionary = ["userName":"devZhang","userPassword":"devZhang"]
        do {
            let data:NSData = try NSJSONSerialization.dataWithJSONObject(postDic, options: NSJSONWritingOptions.PrettyPrinted)
            request.HTTPBody = data
        } catch {
            
        }

        
        
        // NSURLSession
        let configuration:NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session:NSURLSession = NSURLSession(configuration: configuration)
        
        // NSURLSessionTask
        let task:NSURLSessionDataTask = session.dataTaskWithRequest(request, completionHandler: {
            (data:NSData?,response:NSURLResponse?, error:NSError?) -> Void in
            if error == nil
            {
                do {
                    let result:NSDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! NSDictionary
                    print(result)
                    
                    dispatch_async(dispatch_get_main_queue(), {
                        () -> Void in
                        let message:String = result.objectForKey("msg") as! String
                        let alert = UIAlertView(title: nil, message: message, delegate: nil, cancelButtonTitle: "OK")
                        alert.show()
                    })
                    
                } catch {
                    
                }
            }
        })
        // 启动任务
        task.resume()
    }
    
    // MARK: - 带代理
    
    func requestWithDelegate()
    {
        // 请求路径
        let url: NSURL = NSURL(string:"http://120.25.226.186:32812/login?username=520it&pwd=520it&type=JSON")!
        // 请求对象
        // 请求对象内部默认已经包含了请求头和请求方法（GET）
        let request: NSURLRequest = NSURLRequest(URL: url)
        // 会话对象,并设置代理
        /*
        第一个参数：会话对象的配置信息 defaultSessionConfiguration 表示默认配置
        第二个参数：谁成为代理，此处为控制器本身即self，协议 NSURLSessionDelegate
        第三个参数：队列，该队列决定代理方法在哪个线程中调用，可以传主队列|非主队列
        [NSOperationQueue mainQueue]   主队列：   代理方法在主线程中调用
        [[NSOperationQueue alloc]init] 非主队列： 代理方法在子线程中调用
        */
        let session: NSURLSession = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration(), delegate: self, delegateQueue: NSOperationQueue.mainQueue())
        // 根据会话对象创建一个Task(发送请求）
        let dataTask: NSURLSessionTask = session.dataTaskWithRequest(request)
        // 执行任务
        dataTask.resume()
    }

    // MARK: 代理方法
    // 接收到服务器响应的时候调用该方法
    func URLSession(session: NSURLSession, dataTask: NSURLSessionDataTask, didReceiveResponse response: NSURLResponse, completionHandler: (NSURLSessionResponseDisposition) -> Void) {
        
        // 响应头信息，即response
        print("didReceiveResponse--%@", response)
        
        // 注意：需要使用completionHandler回调告诉系统应该如何处理服务器返回的数据
        // 默认是取消的
        /*
        NSURLSessionResponseCancel = 0,        默认的处理方式，取消
        NSURLSessionResponseAllow = 1,         接收服务器返回的数据
        NSURLSessionResponseBecomeDownload = 2,变成一个下载请求
        NSURLSessionResponseBecomeStream        变成一个流
        */
        completionHandler(NSURLSessionResponseDisposition.Allow)
    }
    
    // 接收到服务器返回数据的时候会调用该方法，如果数据较大那么该方法可能会调用多次
    func URLSession(session: NSURLSession, dataTask: NSURLSessionDataTask, didReceiveData data: NSData) {
        
        print("didReceiveData--%@", data)
        
        // 拼接服务器返回的数据
        if self.data == nil
        {
            self.data = NSMutableData()
        }
        self.data.appendData(data)
    }
    
    // 当请求完成(成功|失败)的时候会调用该方法，如果请求失败，则error有值
    func URLSession(session: NSURLSession, task: NSURLSessionTask, didCompleteWithError error: NSError?) {
  
        if (error == nil)
        {
            //解析数据,JSON解析请参考http://www.cnblogs.com/wendingding/p/3815303.html
            var dict:NSDictionary? = nil
            do {
                dict  = try NSJSONSerialization.JSONObjectWithData(self.data, options: NSJSONReadingOptions.init(rawValue: 0)) as? NSDictionary
            } catch {
                
            }
            
            print("%@", dict)
        }
    }
}
