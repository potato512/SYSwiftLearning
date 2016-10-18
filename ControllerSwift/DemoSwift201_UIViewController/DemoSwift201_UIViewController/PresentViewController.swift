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
        self.navigationItem.title = "PresentViewController"
        
        // 视图自适度
        self.autoSize()
        
        // 返回前一个视图控制器
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "back", style: UIBarButtonItemStyle.Done, target: self, action: Selector("backClick"))
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
