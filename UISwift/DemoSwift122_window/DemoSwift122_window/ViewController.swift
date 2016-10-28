//
//  ViewController.swift
//  DemoSwift122_window
//
//  Created by zhangshaoyu on 16/10/19.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//  github学习地址：https://github.com/potato512/SYSwiftLearning

import UIKit

class ViewController: UIViewController {

    var alertWindow:UIWindow!
    var normalWindow:UIWindow!
    var statusBarWindow:UIWindow!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "window"
        
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "hidden", style: .Done, target: self, action: Selector("hiddenClick"))
        
        let normalItem = UIBarButtonItem(title: "normal", style: .Done, target: self, action: Selector("buttonClick:"))
        normalItem.tag = 1
        let alertItem = UIBarButtonItem(title: "alert", style: .Done, target: self, action: Selector("buttonClick:"))
        alertItem.tag = 2
        let statusItem = UIBarButtonItem(title: "status", style: .Done, target: self, action: Selector("buttonClick:"))
        statusItem.tag = 3
        self.navigationItem.rightBarButtonItems = [normalItem, alertItem, statusItem]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func loadView() {
        
        super.loadView()
        
        // 视图控制器背景颜色
        self.view.backgroundColor = UIColor.whiteColor()
        
        // UI适配
        if self.respondsToSelector(Selector("edgesForExtendedLayout"))
        {
            self.edgesForExtendedLayout = UIRectEdge.None
        }
    }
    
    
    func hiddenClick()
    {
        if self.normalWindow != nil
        {
            self.normalWindow.resignKeyWindow()
            self.normalWindow.hidden = true
        }
        
        if self.alertWindow != nil
        {
            self.alertWindow.resignKeyWindow()
            self.alertWindow.hidden = true
        }
        
        if self.statusBarWindow != nil
        {
            self.statusBarWindow.resignKeyWindow()
            self.statusBarWindow.hidden = true
        }
    }
    
    func buttonClick(item:UIBarButtonItem)
    {
        let index = item.tag
        if 1 == index
        {
            self.normalClick()
        }
        else if 2 == index
        {
            self.alertClick()
        }
        else if 3 == index
        {
            self.statusClick()
        }
    }
    
    func normalClick()
    {
        /*
        UIWindow继承自UIView, 用来管理和协调各种视图。提供一个区域来显示视图, 将事件event分发给视图。
        每个iOS应用必须包含一个window用于展示APP的交互页面， 且一个APP通常只有一个UIWindow, 包含了APP的可视内容。
        
        显示优先级, 通常会有三个值, 优先级顺序为:UIWindowLevelAlert > UIWindowLevelStatusBar > UIWindowLevelNormal.
        控制keyWindow的显示，隐藏方法
        （1）显示：makeKeyAndVisible方法，及hiddin属性
        （2）隐藏：resignKeyWindow方法，及hidden属性

        
        */
        
        // UIScreen.mainScreen().bounds
        if self.normalWindow == nil
        {
            self.normalWindow = UIWindow(frame: CGRectMake(60.0, 60.0, (UIScreen.mainScreen().bounds.size.width - 60.0 * 2), (UIScreen.mainScreen().bounds.size.height - 60.0 * 2)))
            self.normalWindow.windowLevel = UIWindowLevelNormal
            self.normalWindow.backgroundColor = UIColor.greenColor()
            self.normalWindow.becomeKeyWindow()
        }
        self.normalWindow.makeKeyAndVisible()
        self.normalWindow.hidden = false
    }
    
    func alertClick()
    {
        // UIScreen.mainScreen().bounds
        if self.alertWindow == nil
        {
            self.alertWindow = UIWindow(frame: UIScreen.mainScreen().bounds)
            self.alertWindow.windowLevel = UIWindowLevelAlert
            self.alertWindow.backgroundColor = UIColor.yellowColor()
            self.alertWindow.becomeKeyWindow()
            
            let label = UILabel(frame: CGRectMake(10.0, 10.0, (CGRectGetWidth(self.alertWindow.frame) - 10.0 * 2), 180.0))
            self.alertWindow.addSubview(label)
            label.backgroundColor = UIColor.orangeColor()
            label.numberOfLines = 0
            label.font = UIFont.systemFontOfSize(13.0)
            label.text = "UIWindow继承自UIView, 用来管理和协调各种视图。提供一个区域来显示视图, 将事件event分发给视图。\n每个iOS应用必须包含一个window用于展示APP的交互页面， 且一个APP通常只有一个UIWindow, 包含了APP的可视内容。\n显示优先级, 通常会有三个值, 优先级顺序为:UIWindowLevelAlert > UIWindowLevelStatusBar > UIWindowLevelNormal."
            
            let button = UIButton(frame: CGRectMake((CGRectGetWidth(self.alertWindow.frame) - 10.0 - 80.0), (CGRectGetMinX(label.frame) + CGRectGetHeight(label.frame) + 10.0), 80.0, 30.0))
            self.alertWindow.addSubview(button)
            button.backgroundColor = UIColor.greenColor()
            button.setTitle("hidden", forState: .Normal)
            button.setTitleColor(UIColor.blackColor(), forState: .Normal)
            button.setTitleColor(UIColor.redColor(), forState: .Highlighted)
            button.addTarget(self, action: Selector("hiddenClick"), forControlEvents: .TouchUpInside)
        }
        self.alertWindow.makeKeyAndVisible()
        self.alertWindow.hidden = false
    }
    
    func statusClick()
    {
        // UIScreen.mainScreen().bounds
        if self.statusBarWindow == nil
        {
            self.statusBarWindow = UIWindow(frame: CGRectMake(10.0, 60.0, (UIScreen.mainScreen().bounds.size.width - 10.0 * 2), (UIScreen.mainScreen().bounds.size.height - 60.0 * 2)))
            self.statusBarWindow.windowLevel = UIWindowLevelStatusBar
            self.statusBarWindow.backgroundColor = UIColor.orangeColor()
            self.statusBarWindow.becomeKeyWindow()
        }
        self.statusBarWindow.makeKeyAndVisible()
        self.statusBarWindow.hidden = false
    }

}

