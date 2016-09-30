//
//  ViewController.swift
//  DemoSwift114_progressview
//
//  Created by zhangshaoyu on 16/9/30.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.title = "progressview的使用"
        
        // 实例化（默认高度是2.0。自定义高度无效，可通过transform属性设置高度）
        let progressview = UIProgressView(frame: CGRectMake(10.0, 10.0, (CGRectGetWidth(self.view.bounds) - 10.0 * 2), 10.0))
        self.view.addSubview(progressview)
        
        progressview.backgroundColor = UIColor.greenColor()
        
        // 样式
        progressview.progressViewStyle = UIProgressViewStyle.Bar
        
        // 初始化进度（默认是0.0，且值范围为0.0~1.0）
        progressview.setProgress(0.3, animated: true)
        
        // 进度条颜色
        progressview.progressTintColor = UIColor.redColor()
        progressview.trackTintColor = UIColor.brownColor()
        progressview.tintColor = UIColor.greenColor()
        
        // 更改进度条高度
        progressview.transform = CGAffineTransformMakeScale(1.0, 3.0);
        
        
        
        // 默认高度2.0
        let progressview00 = UIProgressView(frame: CGRectMake(10.0, 60.0, (CGRectGetWidth(self.view.bounds) - 10.0 * 2), 10.0))
        self.view.addSubview(progressview00)
        progressview00.setProgress(0.6, animated: true)
        
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

