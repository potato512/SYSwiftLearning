//
//  PopViewController.swift
//  DemoSwift202_navigationController
//
//  Created by zhangshaoyu on 16/10/18.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

import UIKit

class PopViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // 导航栏标题
        self.navigationItem.title = "pushViewController"

        
        // 导航视图控制器样式
        self.navigationController!.setNavigationStyle(UIColor.orangeColor(), textFont: UIFont.boldSystemFontOfSize(12.0), textColor: UIColor.yellowColor())
        
        // 导航栏隐藏，或显示
        let button = UIButton(frame: CGRectMake(10.0, 10.0, (CGRectGetWidth(self.view.frame) - 10.0 * 2), 40.0))
        self.view.addSubview(button)
        button.backgroundColor = UIColor.lightGrayColor()
        button.setTitle("隐藏导航栏", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        button.setTitleColor(UIColor.redColor(), forState: UIControlState.Highlighted)
        button.addTarget(self, action: Selector("hiddenClick:"), forControlEvents: UIControlEvents.TouchUpInside)
        button.selected = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func loadView() {
        
        super.loadView()
        
        // 视图控制器背景颜色
        self.view.backgroundColor = UIColor.greenColor()
        
        
        // 适配
        if self.respondsToSelector(Selector("edgesForExtendedLayout"))
        {
            self.edgesForExtendedLayout = UIRectEdge.None
        }
    }

    func hiddenClick(button:UIButton)
    {
        button.selected = !button.selected
        
        let isSelected = button.selected
        let text = (isSelected ? "隐藏" : "显示")
        print("\(text) 导航栏")
        
        if isSelected
        {
            button.setTitle("显示导航栏", forState: UIControlState.Normal)
            self.navigationController!.setNavigationBarHidden(true, animated: true)
        }
        else
        {
            button.setTitle("隐藏导航栏", forState: UIControlState.Normal)
            self.navigationController!.setNavigationBarHidden(false, animated: true)
        }
        
    }
}
