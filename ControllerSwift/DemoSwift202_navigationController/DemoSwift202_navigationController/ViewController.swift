//
//  ViewController.swift
//  DemoSwift202_navigationController
//
//  Created by zhangshaoyu on 16/10/18.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//  github学习地址：https://github.com/potato512/SYSwiftLearning

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 导航视图控制器标题
        self.navigationItem.title = "navigationController"
        
        // 导航视图控制器样式
        self.navigationController!.setNavigationStyleDefault()
        
        // 导航视图控制器左按钮
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "present", style: UIBarButtonItemStyle.Done, target: self, action: Selector("presentClick"))
        self.navigationItem.leftBarButtonItem!.tintColor = UIColor.greenColor()
        
        // 导航视图控制器右按钮
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "push", style: UIBarButtonItemStyle.Done, target: self, action: Selector("pushClick"))
        self.navigationItem.rightBarButtonItem!.tintColor = UIColor.orangeColor()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func loadView() {
        
        super.loadView()
        
        // 视图控制器背景颜色
        self.view.backgroundColor = UIColor.redColor()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // 导航视图控制器样式
        self.navigationController!.setNavigationStyleDefault()
    }
    
    func presentClick()
    {
        print("present Click")
        
        // present视图控制器
        let nextVC = PresentViewController()
        let nextNav = UINavigationController(rootViewController: nextVC)
        self.presentViewController(nextNav, animated: true, completion: nil)
    }
    
    func pushClick()
    {
        print("push Click")
        
        // push视图控制器
        let nextVC = PopViewController()
        self.navigationController!.pushViewController(nextVC, animated: true)
    }
}

