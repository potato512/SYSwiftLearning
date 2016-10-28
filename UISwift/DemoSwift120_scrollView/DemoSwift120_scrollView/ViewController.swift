//
//  ViewController.swift
//  DemoSwift120_scrollView
//
//  Created by zhangshaoyu on 16/10/19.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//  github学习地址：https://github.com/potato512/SYSwiftLearning

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "scrollview"
     
        let normalItem = UIBarButtonItem(title: "normal", style: .Done, target: self, action: Selector("buttonClick:"))
        normalItem.tag = 1
        let pageItem = UIBarButtonItem(title: "page", style: .Done, target: self, action: Selector("buttonClick:"))
        pageItem.tag = 2
        
        self.navigationItem.rightBarButtonItems = [normalItem, pageItem]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func loadView() {
        
        super.loadView()
        
        // 视图控制器背景颜色
        self.view.backgroundColor = UIColor(red: CGFloat(CGFloat(random()) / CGFloat(RAND_MAX)), green: CGFloat(CGFloat(random()) / CGFloat(RAND_MAX)), blue: CGFloat(CGFloat(random()) / CGFloat(RAND_MAX)), alpha: 1.0)
        
        // UI适配
        if self.respondsToSelector(Selector("edgesForExtendedLayout"))
        {
            self.edgesForExtendedLayout = UIRectEdge.None
        }
    }

    
    func buttonClick(itme:UIBarButtonItem)
    {
        let index = itme.tag
        if 1 == index
        {
            let nextVC = NormalVC()
            self.navigationController!.pushViewController(nextVC, animated: true)
        }
        else if 2 == index
        {
            let nextVC = PageControllerVC()
            self.navigationController!.pushViewController(nextVC, animated: true)
        }
    }
}

