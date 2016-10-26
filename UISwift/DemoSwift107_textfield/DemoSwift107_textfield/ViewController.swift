//
//  ViewController.swift
//  DemoSwift107_textfield
//
//  Created by zhangshaoyu on 16/9/28.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//  github学习地址：https://github.com/potato512/SYSwiftLearning

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.title = "textfield的使用"
        
        
        
        let textfield = UITextField(frame: CGRectMake(10.0, 10.0, 200.0,40.0))
        self.view.addSubview(textfield)
        
        // 字体属性设置
        textfield.textColor = UIColor.blackColor()
        textfield.font = UIFont(name: "GillSans", size: 15.0)
        textfield.textAlignment = NSTextAlignment.Left
        textfield.placeholder = "textfield的使用"
        textfield.secureTextEntry = false
        
        // 光标颜色
        textfield.textColor = UIColor.greenColor()
        
        textfield.enabled = true
        textfield.userInteractionEnabled = true
   
        // 样式背景属性
        textfield.backgroundColor = UIColor.lightGrayColor()
        textfield.borderStyle = UITextBorderStyle.Line
//        let image = UIImage(named: "normalImage")
//        textfield.background = image
        
        // 图标
        let leftview = UIImageView(image: UIImage(named: "normalImage"))
        leftview.frame = CGRectMake(0.0, 0.0, 30.0, 30.0)
        textfield.leftViewMode = UITextFieldViewMode.Always
        textfield.leftView = leftview
        let rightview = UIImageView(image: UIImage(named: "hightImage"))
        rightview.frame = CGRectMake(0.0, 0.0, 30.0, 30.0)
        textfield.rightViewMode = UITextFieldViewMode.Always
        textfield.rightView = rightview
        
        // 代理，注意添加代理协议，及实现代理方法
        textfield.delegate = self
        
        // 编辑属性设置
        textfield.clearButtonMode = UITextFieldViewMode.WhileEditing
        
        // 输入设置
        textfield.keyboardType = UIKeyboardType.WebSearch
        textfield.returnKeyType = UIReturnKeyType.Done
        
        // 自定义输入源控件
//        let inputview = UIButton(frame: CGRectMake(0.0, 0.0, CGRectGetWidth(self.view.bounds), 100.0))
//        inputview.setImage(UIImage(named: "normalImage"), forState: UIControlState.Normal)
//        inputview.backgroundColor = UIColor.lightGrayColor()
//        inputview.addTarget(self, action: Selector("click:"), forControlEvents: UIControlEvents.TouchUpInside)
//        textfield.inputView = inputview
        // 自定义输入源控件副视图
        let accessoryview = UIView(frame: CGRectMake(0.0, 0.0, CGRectGetWidth(self.view.bounds), 40.0))
        accessoryview.backgroundColor = UIColor.greenColor()
        let accessoryLeft = UIButton(frame: CGRectMake(10.0, 10.0, 60.0, 20.0))
        accessoryview.addSubview(accessoryLeft)
        accessoryLeft.setTitle("取消", forState: UIControlState.Normal)
        accessoryLeft.backgroundColor = UIColor.orangeColor()
        accessoryLeft.addTarget(self, action: Selector("leftClick:"), forControlEvents: UIControlEvents.TouchUpInside)
        let accessoryRight = UIButton(frame: CGRectMake((CGRectGetWidth(accessoryview.bounds) - 10.0 - 60.0), 10.0, 60.0, 20.0))
        accessoryview.addSubview(accessoryRight)
        accessoryRight.setTitle("确定", forState: UIControlState.Normal)
        accessoryRight.backgroundColor = UIColor.orangeColor()
        accessoryRight.addTarget(self, action: Selector("rightClick:"), forControlEvents: UIControlEvents.TouchUpInside)
        textfield.inputAccessoryView = accessoryview
        
        
        // 其他
        // 第一响应，即进入编辑状态
//        textfield.becomeFirstResponder()
        // 结束响应，即结束编辑
//        textfield.resignFirstResponder()
        // 发通知-输入改变
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("textFiledEditChanged:"), name: UITextFieldTextDidChangeNotification, object: textfield)
        
        
        /*
        注意：不能同时设置clearButtonMode、rightViewMode/rightView 属性，否则只有rightViewMode/rightView有效。
        */
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
    
    //MARK: - UITextFieldDelegate
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        
        print("1 textFieldShouldBeginEditing")
        
        return true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        print("2 textFieldDidBeginEditing")
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        print("3 textField")
        
        return true
    }

    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        print("4 textFieldShouldEndEditing")
        print("text：\(textField.text) length = \(textField.text?.characters.count)")
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        print("5 textFieldDidEndEditing")
    }
    
    func textFieldShouldClear(textField: UITextField) -> Bool {
        
        print("6 textFieldShouldClear")
        
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        // 结束编辑
        textField.resignFirstResponder()
        
        print("7 textFieldShouldReturn")
        
        return true
    }
    
    //MARK: - click
    func click(button:UIButton)
    {
        self.view.endEditing(true)
    }
    
    //MARK: - left/right click
    func leftClick(button:UIButton)
    {
        print("取消")
    }
    
    func rightClick(button:UIButton)
    {
        self.view.endEditing(true)
        print("确定")
    }
    
    //MARK: - 通知响应方法
    func textFiledEditChanged(notification:NSNotification)
    {
        let textField:UITextField! = notification.object as! UITextField
        if (textField != nil)
        {
            let text:String! = textField.text
            let length = text.characters.count
            if (length > 20)
            {
                textField.text = text.substringToIndex(text.startIndex.advancedBy(20))
            }
        }
    }
}

