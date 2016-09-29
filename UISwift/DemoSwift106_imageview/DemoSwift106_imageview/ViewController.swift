//
//  ViewController.swift
//  DemoSwift106_imageview
//
//  Created by zhangshaoyu on 16/9/28.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.title = "imageview的使用"
        
        let imageview = UIImageView(frame: CGRectMake(10.0, 10.0, 100.0, 100.0))
        self.view.addSubview(imageview)
        imageview.backgroundColor = UIColor.yellowColor()
        
        imageview.image = UIImage(named: "normalImage")
        imageview.contentMode = UIViewContentMode.Center
        
        imageview.userInteractionEnabled = true
        imageview.hidden = false
        
        
        // 实例化方法2 highlightedImage、highlighted属性
        let imageview02 = UIImageView(image: UIImage(named: "normalImage"), highlightedImage: UIImage(named: "hightImage"))
        self.view.addSubview(imageview02)
        imageview02.backgroundColor = UIColor.greenColor()
        imageview02.frame = CGRectMake(10.0, 120.0, 100.0, 100.0)
        imageview02.highlighted = true
        
        
        // 实例化方法3
        let imageview03 = UIImageView(image: UIImage(named: "normalImage"))
        self.view.addSubview(imageview03)
        imageview03.backgroundColor = UIColor.redColor()
        imageview03.frame = CGRectMake(0.0, 0.0, 100.0, 100.0)
        imageview03.center = CGPointMake(CGRectGetWidth(self.view.bounds) / 2, CGRectGetHeight(self.view.bounds) / 2)
        // 动画图片属性
        imageview03.animationDuration = 1
        imageview03.animationRepeatCount = 0
        imageview03.animationImages = [UIImage(named: "normalImage")!, UIImage(named: "hightImage")!]
        imageview03.startAnimating()
        
        
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

