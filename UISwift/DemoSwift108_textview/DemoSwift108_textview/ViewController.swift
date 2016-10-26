//
//  ViewController.swift
//  DemoSwift108_textview
//
//  Created by zhangshaoyu on 16/9/28.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//  github学习地址：https://github.com/potato512/SYSwiftLearning

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.title = "textview的使用"
        
        let textview = UITextView(frame: CGRectMake(10.0, 10.0, (CGRectGetWidth(self.view.bounds) - 10.0 * 2), 80.0))
        self.view.addSubview(textview)
        
        textview.backgroundColor = UIColor.lightGrayColor()
        
        // 字体设置
        textview.textAlignment = NSTextAlignment.Left
        textview.textColor = UIColor.redColor()
        textview.font = UIFont(name: "GillSans", size: 15.0)
        
        // 光标颜色
        textview.tintColor = UIColor.greenColor()
        
        textview.editable = true
        textview.userInteractionEnabled = true
        textview.scrollEnabled = true
        textview.showsHorizontalScrollIndicator = true
        textview.showsVerticalScrollIndicator = true
        
        // 代理，注意添加代理协议，及实现代理方法
        textview.delegate = self
        
        // 输入设置
        textview.keyboardType = UIKeyboardType.WebSearch
        textview.returnKeyType = UIReturnKeyType.Done
        
        // 自定义输入源控件
//        let inputview = UIButton(frame: CGRectMake(0.0, 0.0, CGRectGetWidth(self.view.bounds), 100.0))
//        inputview.setImage(UIImage(named: "normalImage"), forState: UIControlState.Normal)
//        inputview.backgroundColor = UIColor.lightGrayColor()
//        inputview.addTarget(self, action: Selector("click:"), forControlEvents: UIControlEvents.TouchUpInside)
//        textview.inputView = inputview
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
        textview.inputAccessoryView = accessoryview
        
        
        // 其他
        // 第一响应，即进入编辑状态
//        textview.becomeFirstResponder()
        // 结束响应，即结束编辑
//        textview.resignFirstResponder()
        // 发通知-输入改变
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("textViewEditChanged:"), name: UITextViewTextDidChangeNotification, object: textview)
        
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
    
    // MARK: - UITextViewDelegate
    
    func textViewShouldBeginEditing(textView: UITextView) -> Bool {
        print("1 textViewShouldBeginEditing")
        
        return true
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        print("2 textViewDidBeginEditing")
    }
    
    func textViewDidChange(textView: UITextView) {
        print("3 textViewDidChange")
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        print("4 textView")
        
        print("text：\(textView.text) length = \(textView.text?.characters.count)")
        
        // 回车时退出编辑
        if text == "\n"
        {
//            textView.endEditing(true)
            // 或
//            self.view.endEditing(true)
            // 或
            textView.resignFirstResponder()
            
            return true
        }
        return true
    }
    
    func textViewShouldEndEditing(textView: UITextView) -> Bool {
        print("5 textViewShouldEndEditing")
        
        return true
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        print("6 textViewDidEndEditing")
    }

    // MARK: - click
    func click(button:UIButton)
    {
        self.view.endEditing(true)
    }
    
    // MARK: - left/right click
    func leftClick(button:UIButton)
    {
        print("取消")
    }
    
    func rightClick(button:UIButton)
    {
        self.view.endEditing(true)
        print("确定")
    }
    
    // MARK: - 通知响应方法
    func textViewEditChanged(notification:NSNotification)
    {
        let textView:UITextView! = notification.object as! UITextView
        if (textView != nil)
        {
            let text:String! = textView.text
            let length = text.characters.count
            if (length > 200)
            {
                textView.text = text.substringToIndex(text.startIndex.advancedBy(200))
            }
        }
    }

    
}

