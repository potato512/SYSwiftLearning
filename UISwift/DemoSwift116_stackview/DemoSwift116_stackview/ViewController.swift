//
//  ViewController.swift
//  DemoSwift116_stackview
//
//  Created by zhangshaoyu on 16/9/30.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.title = "stackview的使用"

        // 实例化（注意：UIStackView在iOS9.0及以上系统版本才有）
        let stackview = UIStackView(frame: self.view.bounds)
        self.view.addSubview(stackview)
        
        stackview.backgroundColor = UIColor.greenColor()
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

