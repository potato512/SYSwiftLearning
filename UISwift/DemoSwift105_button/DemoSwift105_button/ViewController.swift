//
//  ViewController.swift
//  DemoSwift105_button
//
//  Created by zhangshaoyu on 16/9/28.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.title = "button的使用"
        
        let button = UIButton(type: UIButtonType.Custom)
        
        // 添加到父视图，并设置frame
        self.view.addSubview(button)
        button.frame = CGRectMake(10.0, 10.0, 200.0, 40.0)
        
        // 背景属性设置
        button.backgroundColor = UIColor.yellowColor()
//        button.setBackgroundImage(UIImage(named: "normalImage"), forState: UIControlState.Normal)
//        button.setBackgroundImage(UIImage(named: "hightImage"), forState: UIControlState.Highlighted)
        
        // 图标设置
        button.setImage(UIImage(named: "normalImage"), forState: UIControlState.Normal)
        button.setImage(UIImage(named: "hightImage"), forState: UIControlState.Highlighted)
        button.imageEdgeInsets = UIEdgeInsetsMake(0.0, -50.0, 0.0, 0.0)
        
        // 标题设置
        button.setTitle("button", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        button.setTitleColor(UIColor.redColor(), forState: UIControlState.Highlighted)
        button.setTitleShadowColor(UIColor.greenColor(), forState: UIControlState.Normal)
        button.titleLabel?.font = UIFont(name: "GillSans", size: 20.0)
        button.titleEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, 0.0, -50.0)
        
        button.selected = false
        button.enabled = true
        button.userInteractionEnabled = true
        
        // 响应事件
        button.addTarget(self, action: Selector("buttonClick:"), forControlEvents: UIControlEvents.TouchUpInside)
        
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
    
    
    // 响应事件
    func buttonClick(button:UIButton) -> Void
    {
        button.selected = !button.selected
        if button.selected == true
        {
            print("选中按钮")
            
            let buttonTitle = button.titleLabel?.text
            print(buttonTitle)
        }
        else
        {
            print("未选中按钮")
        }
    }

}

