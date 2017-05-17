//
//  ViewController.swift
//  DemoSwift302_Notification
//
//  Created by zhangshaoyu on 17/5/17.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "通知"
        
        self.addNotification()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "send", style: .Done, target: self, action: Selector("sendNotification"))
        
        label = UILabel.init(frame: CGRectMake(10.0, 80.0, (self.view.frame.size.width - 10.0 * 2), 30.0))
        self.view.addSubview(label)
        label.backgroundColor = UIColor.lightGrayColor()
        label.textAlignment = .Center;
        label.textColor = UIColor.blackColor()
        label.font = UIFont.systemFontOfSize(10.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    deinit
    {
        // 移除通知
        NSNotificationCenter.defaultCenter() .removeObserver(self)
        
        print("\(self) 被释放了")
    }
    
    func addNotification()
    {
        // 接收通知
        
        // 先移除通知
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "ChangeBackgroundColor", object: nil)
        
        // 无参数
        // NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("notificationAction"), name: "ChangeBackgroundColor", object: nil)
        
        // 带参数
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("notificationAction:"), name: "ChangeBackgroundColor", object: nil)
    }
    
    func sendNotification()
    {
        // 发送通知
        // 无参数
        // NSNotificationCenter.defaultCenter().postNotificationName("ChangeBackgroundColor", object: nil, userInfo: nil)
        
        // 带参数
        let number = random() % 1000
        let numberString = ("\(number)" as String)
        let dict = ["number":numberString];
        NSNotificationCenter.defaultCenter().postNotificationName("ChangeBackgroundColor", object: dict)
        
        // NSNotificationCenter.defaultCenter().postNotificationName("ChangeBackgroundColor", object: self, userInfo: uderInfo)
    }
    
    // func notificationAction() // 无参数
    func notificationAction(notification:NSNotification) // 带参数
    {
        // 通知响应方法
        let color = UIColor.init(red: (((CGFloat)(random() % 256) / 255.0)), green: (((CGFloat)(random() % 256) / 255.0)), blue: (((CGFloat)(random() % 256) / 255.0)), alpha: 1.0)
        self.view.backgroundColor = color
        
        // 参数
        let name = notification.name
        let dict = notification.object
        let numberText = dict?.valueForKey("number") as! String
        let text = "通知名称：\(name), 传值：\(numberText)"
        label.text = text
    }
    
}

