//
//  PresentViewController.swift
//  DemoSwift201_UIViewController
//
//  Created by zhangshaoyu on 16/10/18.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

import UIKit

class PresentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // 标题
        // 方法1 如果使用了tabbarController时，使用此方法可以避免tabbar切换按钮标题与导航栏标题显示异常
//        self.navigationItem.title = "PresentViewController"
        // 方法2
//        self.title = "PresentViewController"
        // 方法3
//        self.setNavigationTitle("PresentViewController", titleFont: UIFont.boldSystemFontOfSize(20.0), titleColor: UIColor.redColor())
//        self.setNavigationDefaultFontTitle("PresentViewController")
        let label = UILabel(frame: CGRectMake(0.0, 0.0, 200.0, 30.0))
        label.text = "PresentViewController"
        label.textAlignment = NSTextAlignment.Center
        label.textColor = UIColor.greenColor()
        label.font = UIFont.systemFontOfSize(10.0)
        self.setNavigationTitleView(label)
        
        // 视图自适度
        self.autoSize()
        
        // 返回前一个视图控制器，导航栏左按钮
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "back", style: UIBarButtonItemStyle.Done, target: self, action: Selector("backClick"))
        self.navigationItem.leftBarButtonItem = self.setNavigationBarButton("取消", normalColor: UIColor.blackColor(), highlightedColor: UIColor.redColor(), normalImage: UIImage(named: "backImage")!, highlightedImage: UIImage(named: "backImage")!, action: Selector("backClick"), leftButton: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func loadView() {
        
        super.loadView()
        
        // 视图控制器背景颜色
        self.view.backgroundColor = UIColor.orangeColor()
    }
    
    func backClick()
    {
        print("back Click")
        
        // 返回上一个视图控制器
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
