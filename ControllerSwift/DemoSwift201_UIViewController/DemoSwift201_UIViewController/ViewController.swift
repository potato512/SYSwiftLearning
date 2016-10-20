//
//  ViewController.swift
//  DemoSwift201_UIViewController
//
//  Created by zhangshaoyu on 16/10/17.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 视图控制器标题
        self.navigationItem.title = "ViewController"
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "present", style: UIBarButtonItemStyle.Done, target: self, action: Selector("presentClick"))
        self.navigationItem.leftBarButtonItem!.tintColor = UIColor.greenColor()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "push", style: UIBarButtonItemStyle.Done, target: self, action: Selector("pushClick"))
        self.navigationItem.rightBarButtonItem!.tintColor = UIColor.orangeColor()
        
        // 是否是根视图控制器
        let isRoot = self.isRootViewController
        print("\(self) 是根视图控制器吗？(\(isRoot))")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func loadView() {
        
        super.loadView()
        
        // 视图控制器背景颜色
        self.view.backgroundColor = UIColor.whiteColor()
    }
    
    
   
    
    func presentClick()
    {
        print("present Click")
        
        // present视图控制器
        let nextVC = PresentViewController()
        let nextNav = UINavigationController(rootViewController: nextVC)
        /*
        视图控制器翻转效果
        由下向上推出（默认模式） CoverVertical
        水平翻转 FlipHorizontal
        淡入淡出 CrossDissolve
        翻页效果 PartialCurl
        
        注意：如果有导航视图控制器时，翻转效果设置在导航视图控制器；没有时则设置在视图控制器。
        */
        nextNav.modalTransitionStyle = UIModalTransitionStyle.PartialCurl
        
        self.presentViewController(nextNav, animated: true, completion: nil)
    }
    
    func pushClick()
    {
        print("push Click")
        
        // push视图控制器
        let nextVC = PopViewController()
//        self.navigationController!.pushViewController(nextVC, animated: true)
        
        // 转场动画1
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationCurve(UIViewAnimationCurve.EaseInOut)
        UIView.setAnimationDuration(0.6)
        self.navigationController!.pushViewController(nextVC, animated: true)
        UIView.setAnimationTransition(UIViewAnimationTransition.CurlUp, forView: self.navigationController!.view, cache: false)
        UIView.commitAnimations()
    }



}

