//
//  ViewController.swift
//  DemoSwift104_view
//
//  Created by zhangshaoyu on 16/9/27.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//  github学习地址：https://github.com/potato512/SYSwiftLearning

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.title = "view"
        
        let view = UIView(frame: CGRectMake(10.0, 10.0, 200.0, 200.0))
        // 添加到父视图
        self.view.addSubview(view)
        // 背景颜色
        view.backgroundColor = UIColor.redColor()
        // layer层属性设置
        view.layer.cornerRadius = 5.0
        view.layer.borderColor = UIColor.greenColor().CGColor
        view.layer.borderWidth = 1.0
        view.layer.masksToBounds = true
        
        
        let view01 = UIView(frame: CGRectMake(10.0, 10.0, 50.0, 50.0))
        view.addSubview(view01)
        view01.backgroundColor = UIColor.yellowColor()
        
        let view02 = UIView(frame: CGRectMake(20.0, 20.0, 60.0, 60.0))
        view.addSubview(view02)
        view02.backgroundColor = UIColor.blueColor()
        
        let view03 = UIView(frame: CGRectMake(30.0, 30.0, 70.0, 70.0))
        view.addSubview(view03)
        view03.backgroundColor = UIColor.purpleColor()
        
        let view04 = UIView(frame: CGRectMake(10.0, 30.0, 70.0, 70.0))
        view04.backgroundColor = UIColor.orangeColor()
        
        // 显示在最前面
        view.bringSubviewToFront(view01)
        // 显示在最后面
        view.sendSubviewToBack(view03)
        // 插入指定位置
        view.insertSubview(view04, aboveSubview: view03)
        // 交换位置
        view.exchangeSubviewAtIndex(2, withSubviewAtIndex: 3)
        
        
        // 其他属性设置
        view.userInteractionEnabled = true
        view.hidden = false
        view.alpha = 1.0
        
        // 父视图
        let superView = view.superview
        print(superView)
        // 子视图数组
        let subViewArray = view.subviews
        print(subViewArray)
        
        
        let currentView = view
        // 自定义view
//        let rect = CGRectMake(10.0, (CGRectGetMinY(currentView.frame) + CGRectGetHeight(currentView.bounds) + 10.0), 300.0, 40.0)
        let rect = CGRectMake(currentView.right, (currentView.bottom + 10.0), (currentView.width / 2), 40.0)
        let syView = SYView.init(frame: rect)
        syView.height = 100.0
        self.view.addSubview(syView)
        syView.backgroundColor = UIColor.greenColor()
        print(syView)
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
    
    
}

