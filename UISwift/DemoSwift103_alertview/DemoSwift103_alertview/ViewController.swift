//
//  ViewController.swift
//  DemoSwift103_alertview
//
//  Created by zhangshaoyu on 16/9/27.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//  github学习地址：https://github.com/potato512/SYSwiftLearning

import UIKit

class ViewController: UIViewController, UIAlertViewDelegate, UIActionSheetDelegate {

    let alertTitle = "温馨提示"
    let alertMessage = "你点击了弹窗提示"
    let alertCancel = "cancel"
    let alertOK = "OK"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.title = "alertView"
        self.view.backgroundColor = UIColor.whiteColor()
        
        let itemAlert = UIBarButtonItem(title: "alert", style: UIBarButtonItemStyle.Done, target: self, action: Selector("alertClick:"))
        let itemSheet = UIBarButtonItem(title: "sheet", style: UIBarButtonItemStyle.Done, target: self, action: Selector("sheetClick:"))
        self.navigationItem.rightBarButtonItems = [itemAlert, itemSheet]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - alert
    
    func alertClick(button:UIBarButtonItem) -> Void
    {
        showAlert()
    }

    func showAlert()
    {
        // 方法1
//        let alertView = UIAlertView(title: alertTitle, message: alertMessage, delegate: nil, cancelButtonTitle: alertCancel)
//        alertView.show()
        
        // 方法2
        // 实例化时添加代理对象（注意添加协议）
//        let alertView = UIAlertView(title: alertTitle, message: alertMessage, delegate: self, cancelButtonTitle: alertCancel, otherButtonTitles: alertOK, "提示", "通告", "警告")
//        alertView.show()
        
        // 方法3
//        let alertView = UIAlertView()
//        alertView.title = "开始！"
//        alertView.message = "游戏就要开始，你准备好了吗？"
//        alertView.addButtonWithTitle("Ready Go!")
//        alertView.addButtonWithTitle("Cancel")
//        alertView.delegate = self
//        alertView.show()
        
        // 方法4
        // 1 实例化
        let alertVC = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: UIAlertControllerStyle.Alert)
        // 2 带输入框
        alertVC.addTextFieldWithConfigurationHandler {
            (textField: UITextField!) -> Void in
            textField.placeholder = "用户名"
        }
        alertVC.addTextFieldWithConfigurationHandler {
            (textField: UITextField!) -> Void in
            textField.placeholder = "密码"
            textField.secureTextEntry = true
        }
        // 3 命令（样式：退出Cancel，警告Destructive-按钮标题为红色，默认Default）
        let alertActionCancel = UIAlertAction(title: alertCancel, style: UIAlertActionStyle.Destructive, handler: nil)
        let alertActionOK = UIAlertAction(title: alertOK, style: UIAlertActionStyle.Default, handler: {
            action in
            print("OK")
            
            // 3-1 获取输入框的输入信息
            let username = alertVC.textFields!.first! as UITextField
            let password = alertVC.textFields!.last! as UITextField
            print("用户名：\(username.text)，密码：\(password.text)")
        })
        alertVC.addAction(alertActionCancel)
        alertVC.addAction(alertActionOK)
        // 4 跳转显示
        self.presentViewController(alertVC, animated: true, completion: nil)
        
    }
    
    // MARK: UIAlertViewDelegate
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        
        print("click \(buttonIndex)")
        
        let buttonTitle = alertView.buttonTitleAtIndex(buttonIndex)
        if buttonTitle == alertCancel
        {
            print("你点击了取消")
        }
        else if buttonTitle == alertOK
        {
            print("你点击了确定")
        }
        else
        {
            print("你点击了其他")
        }
    }
    
    
    // MARK: - actionSheet
    
    func sheetClick(button:UIBarButtonItem) -> Void
    {
        showActionSheet()
    }
    
    func showActionSheet()
    {
        // 方法1
//        let alertSheet = UIActionSheet(title: alertTitle, delegate: nil, cancelButtonTitle: alertOK, destructiveButtonTitle: alertCancel)
//        alertSheet.showInView(self.view)

        // 方法2
//        // 实例化时添加代理对象，同时注意添加协议
//        let alertSheet = UIActionSheet(title: alertTitle, delegate: self, cancelButtonTitle: alertOK, destructiveButtonTitle: alertCancel, otherButtonTitles: "警告", "提示", "通告")
//        alertSheet.showInView(self.view)
        
        // 方法3
        // 1 实例化
        let alertSheet = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: UIAlertControllerStyle.ActionSheet)
        // 2 命令（样式：退出Cancel，警告Destructive-按钮标题为红色，默认Default）
        let cancelAction = UIAlertAction(title: alertCancel, style: UIAlertActionStyle.Cancel, handler: nil)
        let deleteAction = UIAlertAction(title: "删除", style: UIAlertActionStyle.Destructive, handler: nil)
        let archiveAction = UIAlertAction(title: alertOK, style: UIAlertActionStyle.Default, handler: {
            action in
            print("OK")
        })
        alertSheet.addAction(cancelAction)
        alertSheet.addAction(deleteAction)
        alertSheet.addAction(archiveAction)
        // 3 跳转
        self.presentViewController(alertSheet, animated: true, completion: nil)
    }
    
    // MARK: UIActionSheetDelegate
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        let buttonTitle = actionSheet.buttonTitleAtIndex(buttonIndex)
        if buttonTitle == alertCancel
        {
            print("你点击了退出")
        }
        else if buttonTitle == alertOK
        {
            print("你点击了确定")
        }
        else
        {
            print("你点击了其他")
        }
    }
    
}

