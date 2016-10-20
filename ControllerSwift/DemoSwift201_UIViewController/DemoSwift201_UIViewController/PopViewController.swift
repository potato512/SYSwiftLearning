//
//  PopViewController.swift
//  DemoSwift201_UIViewController
//
//  Created by zhangshaoyu on 16/10/18.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

import UIKit

class PopViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // 标题
        self.navigationItem.title = "PopViewController1"
        
        // 视图自适度
        self.autoSize()
        
        // 进入下一个视图控制器
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "push", style: UIBarButtonItemStyle.Done, target: self, action: Selector("pushClick"))
        
        // 是否是根视图控制器
        let isRoot = self.isRootViewController
        print("\(self) 是根视图控制器吗？(\(isRoot))")
        
        // 视图控制器索引下标
        let index = self.indexViewController
        print("\(self) 是第 \(index) 个视图控制器")
        
        self.setUI()
        
        print("2 viewDidLoad")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        print("? didReceiveMemoryWarning")
    }
    
    override func loadView() {
        
        super.loadView()
        
        // 视图控制器背景颜色
        self.view.backgroundColor = UIColor.blueColor()
        
        print("1 loadView")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        print("3 viewWillAppear")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        print("4 viewWillLayoutSubviews")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        print("5 viewDidLayoutSubviews")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        print("6 viewDidAppear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("7 viewWillDisappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("8 viewDidDisappear")
    }
    
    deinit
    {
        print("9 \(self) 被释放")
    }
    
    func setUI()
    {
        let button = UIButton(type: UIButtonType.Custom)
        self.view.addSubview(button)
        button.frame = CGRectMake(10.0, 10.0, (CGRectGetWidth(self.view.frame) - 10.0 * 2), 40.0)
        button.backgroundColor = UIColor.orangeColor()
        button.setTitle("add childview", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        button.setTitleColor(UIColor.redColor(), forState: UIControlState.Highlighted)
        button.addTarget(self, action: Selector("addClick"), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func pushClick()
    {
        print("push Click")
        
        // 进入下个视图控制器
        let nextVC = PopViewController2()
//        self.navigationController!.pushViewController(nextVC, animated: true)
        
        // 转场动画2
        let animation = CATransition()
        animation.duration = 0.6
        animation.type = kCATransitionReveal
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.subtype = kCATransitionFromBottom
        self.navigationController!.pushViewController(nextVC, animated: true)
        self.navigationController!.view.layer.addAnimation(animation, forKey: nil)
    }

    func addClick()
    {
        print("push Click")
        
        let nextVC = PopViewController2()
        self.addChildViewController(nextVC)
    }
}
